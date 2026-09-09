---
title: "The Node That Wasn't Dead"
subtitle: "A homelab Kubernetes node went NotReady for five days while the Pi was fine. The fix was one haproxy directive."
date: 2026-08-17T21:00:00-07:00
tags: [ "k8s", "homelab", "haproxy", "incident", "kubernetes" ]
---

# Symptom: the IRC bouncer won't come up

Two separate multi-day outages, same shape. A node on the Raspberry Pi cluster goes
NotReady. The Pi is up — SSH works, load is nothing, the kubelet is running. Reboot it and
it comes back. A couple of weeks later a *different* node does the same thing. The thing I
actually noticed each time was ZNC, the IRC bouncer, crashlooping on a lock.

I chased ZNC for longer than I'd like to admit. ZNC was never broken.

## The chain

Here's what was actually happening, in order:

1. One control-plane node's **etcd died** — connection refused on 2379.
2. Its `kube-apiserver` static pod **kept running**. It still accepted TCP, still completed
   TLS on 6443, and then hung forever on every request. A black hole with a valid
   certificate.
3. The API VIP is haproxy on a sixth Pi that isn't a cluster node. It health-checks
   `/readyz`, and it correctly marked the dead apiserver **DOWN** within minutes.
4. But haproxy, by default, only stops sending *new* connections to a DOWN server.
   **Established sessions stay pinned to it.** One of those sessions belonged to another
   node's kubelet.
5. That kubelet's lease renewals started timing out. Lease died a minute later. The node
   went NotReady and sat there — for five days, on a Pi that was completely healthy.

"Rebooting fixes it" now makes sense: the reboot tears down the pinned session, the new
one lands on a live backend. Which node drops is whichever kubelet happened to be pinned
to the dead server when it died. One at a time, at random.

## Why every probe said it was fine

- `nc -z` to the kubelet port succeeds. So does `curl /healthz` returning 401. The kernel
  completes the handshake either way; neither proves the node can talk to the API.
- Hitting the VIP yourself looks perfect — *your* new connection avoids the dead backend.
  Only the pinned client starves.
- The flood of `no relationship found between node X and this object` errors looks like
  RBAC. It's a stale node-authorizer graph on the black-holed apiserver. A tell, not a
  cause.

I also spent a while on the wrong hypothesis: expired kubelet client certs, which this
cluster has history with. Wrong. The journal said `Client.Timeout exceeded while awaiting
headers` on the lease PUT — that's connectivity, not authn. An expired cert gives you x509
or a 401. **Read the actual error.**

The real signal, the whole time, was the node lease's `renewTime`. Everything else was a
proxy for it.

## The fix

One line in the haproxy backend for the control plane:

```
on-marked-down shutdown-sessions
```

When a server is marked DOWN, kill its established sessions too, so clients reconnect and
land on something alive. That's it. The fastest diagnostic, which names the next victim
before it drops, is `show sess` on the haproxy admin socket filtered to that backend.

## The part that's actually embarrassing

The ZNC crashloop was real, just not a symptom of this. ZNC's "already running on this
config" is a lock file on an NFS volume, and the NFS provisioner doesn't enforce
ReadWriteOnce — so during any rollout, two ZNC pods happily mount the same export and the
new one refuses the lock the old one still holds. Every single-replica workload on a
shared NFS PVC on this cluster wedges the same way during a node event. That's a
`strategy: Recreate` and a to-do list, not a mystery.

And the bigger lesson: **that haproxy config lives on a Pi outside GitOps.** Nothing in
the cluster repo reconciles it. It fronts the API, the websites, the bouncer, Icecast — it's
the most load-bearing config in the house and it wasn't in version control. It is now on
the list. The cluster is also running etcd at two of three with zero fault tolerance until
the dead member gets console access, which is the kind of sentence you want to write down
so you can't pretend you didn't know.
