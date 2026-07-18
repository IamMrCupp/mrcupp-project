---
title: Clickfinity (OpenSCAD)
subtitle: Magnet-free Gridfinity baseplates, fully parametric
comments: false
---

### Links
- Source coming once the latch design is dialed in.

### About
A parametric OpenSCAD generator for magnet-free Gridfinity baseplates — the "Clickfinity"
style that holds standard 42&nbsp;mm bins with flexible cantilever latch arms instead of
magnets. No magnets to buy, press, and glue; the bin clicks in and stays put.

It exists because of a gap: the popular OpenSCAD baseplate generators only do magnet or
screw baseplates, and the Clickfinity concept itself lives out there only as proprietary
CAD source plus a handful of fixed-size STLs. This is a clean-room reimplementation from
the published Gridfinity dimensional spec and real measurement — no geometry lifted from
anyone's files.

The make-or-break is the latch. Arm stiffness can't be settled in CAD — it needs printed
test tiles and a real bin in hand to tune. That's the part I'm working through now. It goes
public under MIT once the click actually clicks.
