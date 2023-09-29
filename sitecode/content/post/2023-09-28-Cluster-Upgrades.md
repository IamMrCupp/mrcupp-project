---
title: "2023 09 28 Cluster Upgrades"
subtitle: "upgrading k8s on my rpi cluster"
author: "Aaron Cupp"
type: "walkthrough"
date: 2023-09-28T15:41:30-07:00
bigimg: [{src: "/img/rpikube.png", desc: "RPiKube"}]
tags: [ "k8s", "rasbian", "upgrades" ,"walkthrough" ]
---

# Cluster Upgrade Work

I run a small fleet of Raspberry Pi 4 servers that all run Raspbian.  One this cluster I am running a kubernetes cluster that is made up of 2 master nodes and 3 worker nodes.
I haven't been paying all that much of attention to the cluster and feel a bit behind on the updates.

We'll cover what I needed to do to bring the cluster up-to-date so we can get fluxcd installed into the cluster for GitOps management of the installed apps and websites.

This is being done against a 5-node cluster. 
Order of operations:
- master node 1
- master node 2
- worker node 1
- worker node 2
- worker node 3

The process will be as follows:
- update apt cache
- search for kubeadm version
- unmark kubeadm
- update apt-cache
- install kubeadm version
- mark kubeadm version 

If you need to do multiple versions, do NOT skip versions.  You MUST go from 1.24 -> 1.25 -> 1.26 to ensure you do not break things in the cluster.  Fixing it after-the-fact is never fun!

I will only be documenting the process on one system.

System Specs:
- Raspberry Pi 4 Model B - 8GB memory - 128gb SD card for OS
- Rasbian OS
- amd64 


## Updates

Note: Keep in mind that we are using the `apt-mark hold` command to lock/pin various packages


## Upgrade the master node(s)
Bring the local apt cache up to date
```bash
sudo apt update
```

Lookup the latest patch version
```bash
sudo apt-cache madison kubeadm
```

Install the new version of the kubernetes admin cli too
```bash
# replace x in 1.25.x-00 with the latest patch version
sudo apt-mark unhold kubeadm && \
sudo apt-get update && sudo apt-get install -y kubeadm=1.25.x-00 && \
sudo apt-mark hold kubeadm
```

Verify that we installed the proper version of things
```bash
kubeadm version
```

Verify the upgrade plan for the kubernetes node
```bash
kubeadm upgrade plan
```

Upgrade to your version
```bash
# replace x with the patch version you picked earlier in the process
sudo kubeadm upgrade apply v1.25.x
```

Drain the master node from your desktop cli
```bash
# replace <node-to-drain> with the name of your node you are draining
kubectl cordon <node_to_drain>
kubectl drain <node_to_drain> --ignore-daemonsets
```

Upgrade kubelet and kubectl on node
```bash
# replace x in 1.25.x-00 with the latest patch version
apt-mark unhold kubelet kubectl && \
apt-get update && apt-get install -y kubelet=1.25.x-00 kubectl=1.25.x-00 && \
apt-mark hold kubelet kubectl
```

Restart the kubelet
```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

Uncordon the node
```bash
# replace <node-to-uncordon> with the name of your node
kubectl uncordon <node-to-uncordon>
```


## Upgrade the worker node(s)

Same process as the master nodes, just this time it is on the worker nodes.

Upgrade kubeadm first
```bash
# replace x in 1.25.x-00 with the latest patch version
apt-mark unhold kubeadm && \
apt-get update && apt-get install -y kubeadm=1.25.x-00 && \
apt-mark hold kubeadm
```

run the upgrade process
```bash
sudo kubeadm upgrade node
```

Drain the node
```bash
# replace <node-to-drain> with the name of your node you are draining
kubectl cordon <node-to-drain>
kubectl drain <node-to-drain> --ignore-daemonsets
```

Restart kubelet
```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

Uncordon node
```bash
# replace <node-to-uncordon> with the name of your node
kubectl uncordon <node-to-uncordon>
```


## Verify Upgrade

Check that things finished without issues.  Nodes should all report the same version of k8s
```bash
kubectl get nodes -o wide
```