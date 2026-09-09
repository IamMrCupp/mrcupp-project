---
title: 3D Printer Models
subtitle: Printable models — the STL and the source that makes it
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/3d-printer-models](https://github.com/IamMrCupp/3d-printer-models)
- Print without OpenSCAD: [Releases](https://github.com/IamMrCupp/3d-printer-models/releases)

### About
A version-controlled home for the things I print — and, more importantly, the source that
generates them. Models are authored in OpenSCAD, so **the STL is an output, not the
artifact.** Need it 20&nbsp;mm wider? Change a variable and re-render, instead of hunting for
someone's remix at a size that happens to fit.

Thirty models live here now, and most of them hold the repair bench together. The
bench got reorganized onto Gridfinity over the summer, and nearly everything on it that
isn't an instrument is a print from this repo:

- **Around the iron** — soldering station mounts, a wick-and-solder spool that *is* the
  shaft, a hot-air nozzle rack, a bin for iron tips, and a trough for chip-removal alloy.
- **Cleaning and chemistry** — the bench cleaning station (IPA aerosols, wash bottle, pump,
  sponges, wipes, swabs), syringe holders for flux, and an opaque UV mask station, because
  ambient light skins the mask.
- **Instruments** — docks for a logic analyzer, a chip programmer, and an LCR meter;
  risers that lift the scope and the hot-air station back off the desk; PSU plates; a
  magnet-free tray that clamps onto the OWON PSU; a topper that puts the Shortkiller where
  you can operate it.
- **Optics** — a baseplate that wraps the microscope's boom base and reclaims it as 13
  cells, and a two-part clamp holding the thermal camera on the ring light, aimed at the
  board. The clamp ships an aim-verification script, because a mount pointed at the
  objective still passes a mesh check.
- **Filler tiles** — flat lids that turn empty grid into a working surface, 1×1 to 6×6.
  Corner feet only: a 6×6 latched at every cell would take 45 kgf to lift.
- **Away from the bench** — a VJ rig stand, a drybox splitter stand, an Apache case cord
  organizer, stand cable clamps, sticker inserts, a donation QR stand, a jar tray, a remote
  tray.

Each model is its own directory with parametric source, a README covering dimensions and
print settings, and a Blender preview. That's enforced, not aspirational: a catalog check
fails the PR if a model directory is missing its README, its preview, or its row in the
README table — a model that isn't ready to be catalogued isn't ready to be on `main`. Each
one also releases independently: push a
`<model>/vX.Y.Z` tag and CI renders the STLs plus a preview and publishes them as release
artifacts. On every pull request the same pipeline re-renders everything and runs a
watertight/2-manifold mesh check, so a parameter edit that quietly breaks geometry fails
the build instead of surprising you at the printer.

Licensed two ways, split by what the thing actually is: the models are CC BY-NC 4.0 — share
and remix with attribution, just not commercially — while the parametric library and build
tooling are MIT, because Creative Commons themselves recommend against CC licenses for
software. Every source file carries an SPDX header, so the split travels with the file if
you vendor it.

Designed on a Snapmaker U1, but most of it ports to any FDM printer.
