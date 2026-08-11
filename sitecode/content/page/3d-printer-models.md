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

A dozen models live here now, most of them solving a real problem on a real bench or desk:

- **Bench cleaning station** — Gridfinity cups and bins for the IPA corner: aerosols, wash
  bottle, dispenser pump, melamine sponges.
- **Rotary tool station** — vertical cup for a mini rotary tool plus a drilled block for
  its bits, with a print-first hole-fit gauge so you get the fit right the first time.
- **OWON SPM8104 top tray** — a magnet-free Clickfinity tray that screw-clamps onto the
  PSU, ten cells for the cord and barrel adapters. No adhesive.
- **ENGINDOT Shortkiller topper** — sits on the bench supply lid and holds the short-finder
  where you can actually use it: displays facing you, leads in a bucket behind it instead
  of tangled across the bench.
- **VJ rig stand** — iPad cradle for TouchOSC, trackpad tray, cable holder.
- **Drybox splitter stand**, **Apache 5800 cord organizer**, **stand cable clamps**,
  **sticker-holder inserts**, **syringe holders**, **UV mask station**, **donation QR
  stand** — the rest of the shelf.

Each model is its own directory with parametric source, a README covering dimensions and
print settings, and a Blender preview. Each one also releases independently: push a
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
