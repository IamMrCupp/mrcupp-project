---
title: benchhud-intake
subtitle: Taking work in — and keeping customer data off the stream
comments: false
---

### Links
- Source: [github.com/IamMrCupp/benchhud-intake](https://github.com/IamMrCupp/benchhud-intake)
- Downloads: [GitHub releases](https://github.com/IamMrCupp/benchhud-intake/releases) —
  a `.deb` systemd service (amd64 and arm64), plus tray apps for macOS and Windows
- Installs with the rest of the bench stack via [bench-suite](/page/bench-suite/)

### About
The front door for work arriving at the bench. A tablet-friendly web form for taking a job
in — customer, device, symptom, contact — backed by a small REST API that
[benchhud](/page/benchhud/) reads as a ticket source, so an intake ticket can be dropped
onto the bench as a job without retyping anything.

It exists as its own service for one specific reason, and it's the most interesting thing
about it.

**benchhud composites its panels to a virtual camera for streaming.** Anything benchhud can
see is potentially on a stream. Customer names, phone numbers, and addresses cannot live
anywhere near that surface — so they live here instead, and benchhud stores only a reference
pointing back.

That makes this repo the system of record for customer data, and it's why it stays LAN-only
and never gets a public ingress. Its sibling [bench-parts](/page/bench-parts/) holds no PII
at all, which is exactly why *that* data is allowed on the HUD.

Two deployment constraints worth writing down, both easy to get wrong and unpleasant to
debug: the SQLite database lives on an NFS volume, so it runs `journal_mode=TRUNCATE` with
`synchronous=FULL` rather than WAL — WAL misbehaves on NFS and fails by corrupting instead of
erroring. And there's exactly one writer, so the deployment stays at a single replica with a
recreate strategy.

Python and FastAPI. It runs however your bench does — a sandboxed `.deb` service on
`127.0.0.1:8401`, a tray app, a container from the compose file, or a kustomize base for
Kubernetes. Mine runs on a Raspberry Pi cluster over Flux. Source-available under the
PolyForm Small Business License.
