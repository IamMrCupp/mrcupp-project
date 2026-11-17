---
title: benchhud
subtitle: A heads-up display for the microsoldering bench
comments: false
---

### Links
- Source: [github.com/IamMrCupp/benchhud](https://github.com/IamMrCupp/benchhud) —
  source-available under the PolyForm Small Business License
- Downloads: [GitHub releases](https://github.com/IamMrCupp/benchhud/releases) — Ubuntu
  `.deb` and Windows `.msi`; macOS builds from source
- Installs with the rest of the bench stack via [bench-suite](/page/bench-suite/)
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
- **Ticket import** — optionally pull the open queue from
  [intake](/page/benchhud-intake/) and drop a ticket onto the bench as a job. Runs
  standalone without one.
- **Board docs** — a local library of board-view files keyed by part number, opened in
  OpenBoardView or FlexBV. "Do I have this board?" answered from the job, or across the
  whole open queue as a boards-to-source list.
- **Tool launcher** — one-click into the repair tools already on the machine.
- **Terminal** — a shell in a panel, and optionally on stream as a read-only source with a
  pause button for anything private.

It composites the whole thing to a virtual camera, so OBS grabs it as a normal source —
and the meter, power graph, job card, and a now-playing banner are each served as their own
transparent browser source, so every panel can sit anywhere in the scene. None of them ever
shows the customer. That's the other half of the point: it's built to power board-repair
streams, not just my own bench.

Status, honestly: **running on the bench.** Scope capture, the thermal overlay with real
temperatures, and virtual-camera output into OBS all run on Ubuntu, and macOS virtual-camera
output is verified on real hardware too. Windows virtual-camera output isn't built yet.
Releases land often — expect the odd rough edge.
