---
title: benchhud
subtitle: A heads-up display for the microsoldering bench
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/benchhud](https://github.com/IamMrCupp/benchhud)

### About
benchhud is the command center for a board-repair bench — a HUD shell that hosts
pluggable panels, so everything I need while working on a board lives in one window
instead of three.

The panels that matter:

- **Scope** — the live microscope feed.
- **Thermal fusion** — a thermal camera registered onto the scope image, so a component's
  heat bloom lands right on top of the component itself. A short on a rail lights up the
  part that's drawing current — the headline feature.
- **Instrument telemetry** — live DMM and power-supply readings pulled over SCPI, on
  screen next to the work instead of on a bench meter I have to glance away at.
- **Tool launcher** — one-click into the adjacent repair tools (OpenBoardView, a chip
  programmer GUI, and so on).

It composites the whole thing to a virtual camera, so OBS can grab it straight into a
stream. That's the other half of the point — it's built to power board-repair and
project-building streams, not just my own bench.

It's Linux-first and still in active development — planned open source under MIT once it's
past the "works on my bench" stage.
