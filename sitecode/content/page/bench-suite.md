---
title: bench-suite
subtitle: One install for the whole repair bench
comments: false
---

### Links
- Source: [github.com/IamMrCupp/bench-suite](https://github.com/IamMrCupp/bench-suite)
  (PolyForm Small Business 1.0.0)
- Write-up: [One Install for the Bench](/post/2026-11-16-bench-suite/)

### About
The bench runs on four apps that talk to each other, and setting them up by hand meant
copying URLs and API tokens between four config files. **bench-suite does that part for
you** — a fresh machine goes from nothing to a working bench in two commands:

```sh
sudo apt install bench-suite
sudo bench-setup
```

`bench-suite` is a metapackage. `bench-setup` asks for one password and sets it on every
service, mints each service's API token and writes it into benchhud's config, asks whether
to turn bench-recon on, and checks every service answers before calling the job done. Run
it again any time — it only changes what's missing, and a service that already has a token
keeps it.

### What it puts together

| App | What it does | Where it runs |
|---|---|---|
| [benchhud](/page/benchhud/) | The command center at the bench — scope, thermal, instruments, stream-safe overlays | Desktop app |
| [benchhud-intake](/page/benchhud-intake/) | Work coming in — customers, devices, tickets | Service, `127.0.0.1:8401` |
| [bench-parts](/page/bench-parts/) | Stock on the shelf, consumed against a job | Service, `127.0.0.1:8402` |
| [bench-recon](/page/bench-recon/) | Pentest engagements and targets — installed, **off until you turn it on** | Service, `127.0.0.1:8403` |

Every service listens on loopback only. benchhud talks to them on the same box; nothing is
reachable from the LAN unless you put it there.

### Containers instead
If you'd rather not install the service packages, the three services run from a
`compose.yaml` in the repo, and `bench-setup services --compose` does the same wiring
through Docker — ports published on `127.0.0.1` only, bench-recon behind a compose profile
so a plain `docker compose up -d` never starts it.

### Status
Under construction, but the hard part works: CI installs the packages with all four apps on
a clean Ubuntu 26.04 and runs the setup end to end. The last piece is going up now — a signed
apt repo at apt.yolorepair.com, with install instructions landing alongside it. macOS gets
the same through a Homebrew tap; Windows comes later.
