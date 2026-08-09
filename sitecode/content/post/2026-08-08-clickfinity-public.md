---
title: "Clickfinity: It Clicks, and It Tiles"
subtitle: "Magnet-free Gridfinity baseplates, now public"
date: 2026-08-08T10:00:00-07:00
tags: [ "3d printing", "openscad", "gridfinity", "clickfinity", "projects" ]
---

# The magnet tax

[Gridfinity](https://gridfinity.xyz/) is Zack Freedman's 42&nbsp;mm modular storage grid, and
it's the best thing to happen to a messy bench in years. The catch is the baseplates. The
standard ones hold bins with magnets, which means buying a bag of 6×2s, pressing a hundred of
them into a hundred little holes, and gluing the ones that won't stay.

Clickfinity is the alternative: instead of magnets, the plate has flexible latch tongues that
catch the bin's foot. Push the bin in, it clicks, it stays. Nothing to buy, nothing to press,
nothing to glue.

The problem was availability. The dominant OpenSCAD generator —
[kennetek's](https://github.com/kennetek/gridfinity-rebuilt-openscad), which is excellent —
does magnet and screw baseplates only. And the Clickfinity concept itself exists out there as
proprietary CAD plus a handful of fixed-size STLs. Fixed sizes are exactly what parametric
storage shouldn't be.

So I wrote [a generator](https://github.com/IamMrCupp/clickfinity-openscad). Clean-room, from
the published Gridfinity dimensional spec and a lot of caliper work — no geometry lifted from
anyone's files.

## Why it took a while to publish

The latch was always going to be the make-or-break, and it's not a problem you can settle in
CAD. Arm stiffness is a function of your filament, your walls, your cooling, and your
printer's particular idea of what 0.4&nbsp;mm means. The preview looks identical whether the
click is perfect or the tongue snaps off. **You have to print it and hold it.**

That's what the last stretch was: test tiles, a real bin, and a lot of adjusting one number
at a time. It's tuned now. Grip is moderate and it's a parameter, so you can go firmer or
looser to suit your printer.

## Then it grew a second half

Somewhere in the tuning it became obvious that one-plate-at-a-time was the wrong unit. You
don't want to commit to your whole bench layout up front and print a monolith — you want to
add a plate when you add a shelf.

So plates join now. Every edge carries the same half-pocket on its underside; butt two plates
and the halves line up into one bowtie cavity, and a key drops in from below. Lay both plates
face-down, drop the keys in, flip. The bench traps them — nothing to glue.

The bit I'm actually pleased with: **the joint is symmetric.** There's no male side and no
female side. Any edge mates with any edge, in any direction, which means a plate you print six
months from now still attaches to the ones already on your bench. No orientation to get wrong,
no "wrong end" plate to reprint.

The keys live in the solid wall band near the cell corners, not cut into the plate edge — the
perimeter wall is only 2.15&nbsp;mm thick and thins to under a millimetre at the top rim, so an
edge dovetail deep enough to hold would break straight through into the bin socket.

Any size you want is two knobs and a flag:

```
GRID_X = 6;   GRID_Y = 3;   JOIN = true;
```

## Getting it

The repo is public and MIT licensed. If you just want to print something, every release ships
ready-to-print STLs — a 6×3 with joiners, the connector keys, and test tiles — so you don't
need OpenSCAD at all. If you want your own size, you do, and it's one command.

One print note worth repeating because it's the difference between working and not: **PETG,
not PLA.** The tongues sit under constant spring tension and PLA creeps — it'll hold fine for
a month and then stop holding at all.

Print the test tile first. The click is a tolerance problem, and your printer isn't mine.
