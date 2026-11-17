---
title: bench-recon
subtitle: A system of record for hardware pentest engagements
comments: false
---

### Links
- Source: [github.com/IamMrCupp/bench-recon](https://github.com/IamMrCupp/bench-recon)
  (AGPL-3.0-or-later)
- Image: `ghcr.io/iammrcupp/bench-recon` (linux/amd64, linux/arm64)
- Part of [bench-suite](/page/bench-suite/)
- Runs on the bench at [YOLO Electronics Repair](https://yolorepair.com/)

### About
Repair isn't the only thing that happens at the bench. Hardware, automotive, and IoT
pentesting uses the same microscope and the same programmers — and generates a very
different kind of record. **bench-recon is where that record lives.**

An engagement holds the scope, the authorization, the client reference, dates, and status.
Under it sit one or more targets — the devices under test — and each target accumulates an
append-only findings log and on-disk artifacts: firmware dumps, captures, whatever came off
the board. It's a small FastAPI + SQLite app with a LAN REST API, built as a sibling to
[benchhud-intake](/page/benchhud-intake/).

### Sensitive by design
A running bench-recon holds client identities, authorization text, findings, and sometimes
credentials. So it follows the same rule as the rest of the bench stack, only stricter:

- **LAN-only, always.** No public ingress, no port forward.
- **Deny-by-default auth** — a scrypt-hashed password, a bearer token for the API, CSRF on
  every form, a login throttle.
- **benchhud only gets a ref-safe projection** — a reference, a safe title, the target
  class, and a status. Nothing identifying can reach the thing that composites to a stream.
  Same idea as [the intake boundary](/post/2026-08-10-bench-stack-privacy-boundary/).
- **The Debian package installs dormant.** The service is neither enabled nor started until
  you say so, because nothing holding client data should run by accident.

The code is public. Your engagement data stays on your bench.

### Running it
A `.deb` runs it as a hardened systemd service on `127.0.0.1:8403`; a multi-arch image and
a kustomize base cover Compose and Kubernetes. Mine runs on the Pi cluster — SQLite on NFS,
a LAN-only LoadBalancer IP, Flux image automation, and a nightly backup.
