---
title: bench-suite
subtitle: One install for the whole repair bench
comments: false
---

### Links
- Source: [github.com/IamMrCupp/bench-suite](https://github.com/IamMrCupp/bench-suite)
  (AGPL-3.0-or-later, like every app it installs — commercial licenses for anyone the AGPL
  doesn't fit)
- Mac: [the Homebrew tap](https://github.com/IamMrCupp/homebrew-bench)
- Write-up: [One Install for the Bench](/post/2026-11-16-bench-suite/)

### About
The bench runs on four apps that talk to each other, and setting them up by hand meant
copying URLs and API tokens between four config files. **bench-suite does that part for
you** — once the apt repo is added, a fresh machine goes from nothing to a working bench in
two commands:

```sh
sudo apt install bench-suite
sudo bench-setup
```

`bench-suite` is a metapackage. `bench-setup` asks for one password and sets it on every
service, mints each service's API token and writes it into benchhud's config, asks whether
to turn bench-recon on, and checks every service answers before calling the job done. Run
it again any time — it only changes what's missing, and a service that already has a token
keeps it.

The services are only the first step. `bench-setup` also walks the host side benchhud needs
— the virtual camera OBS reads from, stable names for the USB cameras so a replug doesn't
swap them — and `bench-setup doctor` checks the whole lot without changing anything.

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
**Installable today.** On Ubuntu 26.04 (amd64) it comes from a signed apt repo at
apt.yolorepair.com — the bench software and [the repair shop](https://yolorepair.com/) share
a domain for a reason. The repo line, signing key, and fingerprint are in
[the README](https://github.com/IamMrCupp/bench-suite#install). On an Apple silicon Mac,
[the Homebrew tap](https://github.com/IamMrCupp/homebrew-bench) installs benchhud, the
intake and parts menu-bar apps, and `bench-setup`; bench-recon runs there as a container.
CI installs from both on a clean machine. Windows comes later.
