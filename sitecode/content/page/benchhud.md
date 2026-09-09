---
title: benchhud
subtitle: A heads-up display for the microsoldering bench
comments: false
---

### Links
- Source: private for now. Builds will be posted here as downloads once it's past the
  "works on my bench" stage, while I settle how the source gets shared.
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
- **Instrument telemetry** — live DMM and power-supply readings pulled over SCPI, in a
  bench-style meter with peak-hold and a trend graph, on screen next to the work.
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

It composites the whole thing to a virtual camera, so OBS grabs it as a normal source.
That's the other half of the point — it's built to power board-repair streams, not just
my own bench.

Status, honestly: built and tested off-hardware — shell, capture pipeline, thermal math,
compositing, instrument driver, repair log. Scope capture is verified against the real
camera; the rest of the device-facing work sits behind tested interfaces and gets wired
up on the bench. Not a daily driver yet.
