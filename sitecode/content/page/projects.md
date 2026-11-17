---
title: Projects
subtitle: Things I'm building
comments: false
---

I build at the intersection of sound, light, and infrastructure — plus a few things that
just needed to exist. Some of these are shipping, some are still on the bench. Here's what
I'm working on.

### Music & audio
- [Tech-Noid Systems](/page/tech-noid-systems/) — my bass music and visual collective:
  a soundsystem, live shows, streaming, and the tooling behind the feed.
- [obs-radio-output](/page/obs-radio-output/) — a native OBS plugin that streams straight
  to Icecast/SHOUTcast. Public beta on macOS, Linux, and Windows.

### Light & visuals
- [Audiophore](/page/audiophore/) — a low-latency bridge from Synesthesia to your whole
  lighting rig. Drive Hue, WLED, Art-Net, and lasers from one place.

### Electronics & repair
The repair work itself runs as [YOLO Electronics Repair](https://yolorepair.com/). These are
the tools behind it — the bench apps are open source under AGPL-3.0.

- [benchhud](/page/benchhud/) — a heads-up display for the microsoldering bench: scope,
  thermal fusion, instrument telemetry, flash dumps, and known-good comparisons in one
  window, composited straight into a stream.
- [bench-parts](/page/bench-parts/) — self-hosted parts and test-gear inventory, with a REST
  API benchhud reads so stock shows up on the HUD.
- [benchhud-intake](/page/benchhud-intake/) — the front door for work coming in, and the
  reason customer data lives nowhere near the thing that streams.
- [bench-recon](/page/bench-recon/) — the system of record for hardware pentest engagements.
  LAN-only, installs switched off, and benchhud only ever sees a ref.
- [bench-suite](/page/bench-suite/) — one install for all four: a signed apt repo, a Homebrew
  tap, and a setup command that wires them to each other.
- [burnwright](/page/burnwright/) — an open-source GUI for XGecu chip programmers, on macOS
  and Linux as well as Windows.
- [PCIe GPU Test Rig](/page/pcie-gpu-test-rig/) — a fused, switched, metered 12 V box for running a
  graphics card on the bench with no motherboard. Public schematic and wiring guide.
- [OpenBoardView](/page/openboardview/) — not mine, but I keep patching it: macOS
  cross-probing, KiCad and `.bv` board import, and parser fixes, all sent upstream.

### 3D printing & making
- [3D Printer Models](/page/3d-printer-models/) — thirty-eight printable models, kept as source
  so you can regenerate them, not just download a fixed STL. Most of them hold the bench
  together.
- [Clickfinity (OpenSCAD)](/page/clickfinity-openscad/) — magnet-free Gridfinity
  baseplates, fully parametric. It clicks, and it tiles.
- [Snapmaker U1 tooling](/page/snapmaker-u1-tooling/) — firmware patching and RFID
  diagnostics for the printer all of the above comes off, plus an iOS app that writes
  OpenSpool NFC spool tags.

### Tools & apps
- [claude-project-kit](/page/claude-project-kit/) — a scaffolding kit that starts every
  AI-assisted session already grounded. Bootstrap script, lifecycle commands, a lint that
  catches convention drift.
- [apptracker](/page/apptracker/) — self-hosted job-hunt tracking that lives in your
  cluster instead of one browser's local storage.
- [recipe-card-maker](/page/recipe-card-maker/) — markdown recipes in, printable binder
  pages and tin cards out.

### Chat & bots
- [annoybots](/page/annoybots/) — the eggdrop and BMotion era rebuilt as one Go binary:
  IRC, Twitch, and Discord at once, with a Markov brain that still babbles.
- [pwnagotchi plugins](/page/pwnagotchi-plugins/) — two small plugins for the little
  Wi-Fi-handshake Tamagotchi: an age readout the current image lost, and a pcap cleaner.

### And one more
- [Emotional Support Pizza](/page/emotional-support-pizza/) — artisan baked pizza, breads,
  and pastries.

### Coming up
- [sekrit](/page/sekrit/) — open, self-hostable event ticketing for independent
  promoters. No gatekeeping, you own your list, your money never touches the platform.
  Pre-alpha, and the first thing here built for the scene rather than the bench.
