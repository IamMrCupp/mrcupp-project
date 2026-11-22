---
title: benchhud
subtitle: A heads-up display for the microsoldering bench
comments: false
---

### Links
- Source: [github.com/IamMrCupp/benchhud](https://github.com/IamMrCupp/benchhud)
  (AGPL-3.0-or-later)
- Downloads: [GitHub releases](https://github.com/IamMrCupp/benchhud/releases) — Ubuntu
  `.deb`, Windows `.msi`, and a signed, notarized macOS `.dmg` (Apple silicon)
- Installs with the rest of the bench stack via [bench-suite](/page/bench-suite/)
- Runs on the bench at [YOLO Electronics Repair](https://yolorepair.com/)
- How it fits with the rest of the bench stack: [Three Services, One Privacy Boundary](/post/2026-08-10-bench-stack-privacy-boundary/)

### About
benchhud is the command center for a board-repair bench — a HUD shell that hosts
pluggable panels, so everything I need while working on a board lives in one window
instead of three. It started as "I want to see which part is overheating without looking
away from the scope." It turned into the bench's command center.

The panels that matter:

- **Scope** — the live microscope feed.
- **Thermal fusion** — a thermal camera registered onto the scope image, so a component's
  heat bloom lands right on top of the component itself. A short on a rail lights up the
  part that's drawing current, with a live temperature label — the headline feature. It
  reads the camera's raw Y16 stream, not the pre-coloured picture, so the number is a
  measurement rather than a mood. [How the fusion works](/post/2026-08-10-benchhud/).
- **Known-good compare** — save a good board's scope frame per board number, then fade
  it over the live view or blink between them to spot what's missing.
- **Instrument telemetry** — live DMM and power-supply readings pulled over SCPI, in a
  bench-style meter with peak-hold and a trend graph, on screen next to the work.
- **Readings** — test-point measurements from the DMM, compared live against a known-good
  board of the same part number. A short shows up as LOW the moment you probe it.
- **Power-on signatures** — the current draw for the first seconds after output on, saved
  on the job and compared with a known-good board. A rail that never comes up shows as LOW.
- **Flash** — read, back up, and write SPI flash with flashrom, or chips on a T48 with
  minipro. A backup is two reads that must match, and every dump is filed with the job.
- **Repair jobs** — a local-first log of what's on the bench. One button attaches the
  current scope frame, thermal frame, and meter readings to the job timeline; an
  over-current trip logs itself. Export a customer-facing report when the job's done.
  `benchhud job new`, `select`, and `set` do the same from a terminal, so the job card on
  stream doesn't need a walk to the bench.
- **Ticket import** — optionally pull the open queue from
  [intake](/page/benchhud-intake/) and drop a ticket onto the bench as a job. Runs
  standalone without one. When intake or [bench-parts](/page/bench-parts/) runs on the
  same machine, **Find on this machine** in Preferences fills in its address.
- **Board docs** — a local library of board-view files keyed by part number, opened in
  OpenBoardView or FlexBV. "Do I have this board?" answered from the job, or across the
  whole open queue as a boards-to-source list.
- **Chip reference** — type the mark printed on a part, like `X1=6A`, or a part number,
  and get every chip it could be: maker, package, what it does, and the datasheet if I
  have it. It's a list, never one answer, because the same three characters turn up on
  different chips. It reads offline from folders I keep, my own notes on top of shared
  data. benchhud ships no chip data and downloads nothing. When my data draws a blank,
  Find chip hands the mark to a marking site in the browser, on a click only. Picking a
  part in inventory shows the same details, and a chip card can go on stream: the part,
  its package, and its marks, never the notes.
  [How it works](https://github.com/IamMrCupp/benchhud/blob/main/docs/CHIPS.md).
- **Tool launcher** — one-click into the repair tools already on the machine, from a dock
  along the bottom of the window.
- **OBS scenes** — tools with windows of their own, like PulseView or OpenBoardView, each
  get a scene on stream. The Tools dock shows which scene is live and switches it, so
  showing a tool doesn't mean a trip to OBS and back. Optionally, a tool brings its own
  scene up when it starts and hands the old one back when it exits — unless someone changed
  the scene by hand in the meantime. Off until you turn it on, since it changes what's on
  air. OBS still builds the scenes; benchhud only picks one.
- **Terminal** — a shell in a panel, and optionally on stream as a read-only source with a
  pause button for anything private.

It composites the whole thing to a virtual camera, so OBS grabs it as a normal source —
and the meter, power graph, job card, and a now-playing banner are each served as their own
transparent browser source, so every panel can sit anywhere in the scene. None of them ever
shows the customer. That's the other half of the point: it's built to power board-repair
streams, not just my own bench.

Status, honestly: **running on the bench.** Scope capture, the thermal overlay with real
temperatures, and virtual-camera output into OBS all run on Ubuntu, and macOS virtual-camera
output is verified on real hardware too. Windows has a virtual camera now as well — the
installer ships and registers one — and on CI's Windows runner a DirectShow reader gets the
HUD's picture back byte for byte. No Windows bench has run it yet, and nobody has watched it
in OBS there. Releases land often — expect the odd rough edge.

It also matches [burnwright](/page/burnwright/) now — same palette, same panel look — so
the two desktop apps on the bench read as one kit.
