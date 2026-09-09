---
title: "Twelve Models Became Thirty"
subtitle: "The bench moved onto Gridfinity, and the repo grew to match"
date: 2026-09-08T21:30:00-07:00
tags: [ "3d printing", "openscad", "gridfinity", "electronics", "projects" ]
---

# The bench went on the grid

When I [wrote about the models repo](/post/2026-08-03-3d-printer-models/) in August it held
a dozen things, and the pitch was that the STL is an output you regenerate, not a mesh
you're stuck with. That's still the pitch. What changed is the bench.

Over the summer the whole repair bench got reorganized onto Gridfinity — the
[magnet-free Clickfinity](/page/clickfinity-openscad/) flavour, on shallow plates. Once the
surface is a grid, every tool that used to sit *on* the bench wants a bin, a dock, a riser,
or a plate that puts its footprint back into the grid. So the repo went from twelve models
to **thirty**, and nearly everything on the bench that isn't an instrument is now a print
from it. The [catalog](/page/3d-printer-models/) has the full list; here are the ones with
a story.

## The shaft that is the spool

Solder wick comes on spools with a small bore. The downloaded holder I was using has a
⌀14.6 shaft, which is too fat for them. The obvious fix is a thinner shaft. The better fix
is a shaft that *is* a spool — flats on the journal, a winder plate, a crank — so you wind
wire or wick straight onto it and there's no bore to match at all. Base and brackets
unchanged. Now it holds anything.

## Nine posts for ten nozzles

The hot-air rack has nine posts. The wand came with ten nozzles. That's not a mistake: one
nozzle is always on the wand, and a 7×1 rack that held all ten would be longer than the
printer bed. **Nine covers ten.** Small design decisions like that are most of what a bench
fixture is.

## A mount that passes the mesh check and points at the wrong thing

The thermal camera mount is a two-part sandwich clamp on the ring light's control tab,
aimed down at the board. It went through more revisions than anything else in the repo,
mostly because of one fact: a mount pointed at the microscope objective instead of the
board is still a perfectly watertight, 2-manifold mesh. CI can't see aim. So the model ships
an **aim-verification script** that checks where the camera's axis actually lands, because
the failure mode was invisible to every other check.

## Corner feet only

The filler tiles turn empty grid into a working surface — mouse, drink, wrist rest — and
lift out to be storage again. The first instinct is to latch every cell. Don't. A
Clickfinity cell grips at roughly 12 N, so a 6×6 tile footed everywhere takes about
**45 kgf to lift** — a permanent fixture you'd break removing. Four corner feet cap release
at about 5 kgf at any size, and underside ribs bear on the grid walls so the middle doesn't
sag. That rule now applies to every multi-cell part in the repo.

## Measure, then print

Two parts in August came out wrong for the same reason: a number in the source that was
assumed instead of measured. A syringe bore. A swab length. Both scrapped prints. The
response wasn't more careful guessing — it was **gauges**: print-first fit coupons that live
in a `coupons/` directory beside the model, get rendered and validated by CI like everything
else, and get skipped by the release build so a release stays a set of parts you can print
without reading anything first. Real measurements, no guesses.

## The catalog is enforced now

Thirty directories is enough that the README table drifts if you let it. So it can't. A
catalog check runs on every PR and fails it if a model directory is missing its README, its
preview, or its row in the table. No exemption list on purpose — a model that isn't ready
to be catalogued isn't ready to be on `main`.

---

Everything's on [GitHub](https://github.com/IamMrCupp/3d-printer-models), each model with its
own release, source under CC BY-NC and the library and tooling under MIT. If your bench
lives on a grid, there's probably something in there you can regenerate at your own
dimensions.
