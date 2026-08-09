---
title: Clickfinity (OpenSCAD)
subtitle: Magnet-free Gridfinity baseplates, fully parametric
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/clickfinity-openscad](https://github.com/IamMrCupp/clickfinity-openscad)
- Print without OpenSCAD: [latest release](https://github.com/IamMrCupp/clickfinity-openscad/releases/latest)

### About
A parametric OpenSCAD generator for magnet-free Gridfinity baseplates — the "Clickfinity"
style that holds standard 42&nbsp;mm bins with flexible cantilever latch arms instead of
magnets. No magnets to buy, press, and glue; the bin clicks in and stays put.

It exists because of a gap: the popular OpenSCAD baseplate generators only do magnet or
screw baseplates, and the Clickfinity concept itself lives out there only as proprietary
CAD source plus a handful of fixed-size STLs. This is a clean-room reimplementation from
the published Gridfinity dimensional spec and real measurement — no geometry lifted from
anyone's files.

**It clicks, and it tiles.** The latch was the make-or-break — arm stiffness can't be
settled in CAD, it needs printed test tiles and a real bin in hand — and it's tuned. Grip
is moderate and adjustable.

Plates also join edge-to-edge now. Every edge carries the same half-pocket on its underside,
so butting two plates lines the halves up into one bowtie cavity and a key drops in from
below. The joint is **symmetric** — no male and female side, so any edge mates with any
edge in any direction, and a plate you print six months from now still attaches to what's
already on the bench. Nothing to glue; the bench traps the keys.

Any size is two knobs and a flag:

```
GRID_X = 6;   GRID_Y = 3;   JOIN = true;
```

Ready-to-print STLs ship with every release if you'd rather not install OpenSCAD. Print in
PETG rather than PLA — the tongues sit under spring tension and PLA creeps. MIT licensed.
