---
title: "The STL Is the Output, Not the Thing"
subtitle: "A dozen printable models, kept as source"
date: 2026-08-03T16:00:00-07:00
tags: [ "3d printing", "openscad", "gridfinity", "electronics", "projects" ]
---

# Downloading a mesh is downloading someone else's decisions

Everyone's had this one. You find a model that's nearly right — the tray you need, except
it's 8&nbsp;mm too wide for the drawer. So you go looking for a remix at the size you want,
and either somebody made one or you're editing a mesh, which is the 3D equivalent of editing
a JPEG when you wanted the layered file.

That's the problem with distributing STLs. **A mesh is a build artifact that someone shipped
instead of the source.**

So [my models repo](https://github.com/IamMrCupp/3d-printer-models) keeps the source. Models
are written in OpenSCAD — parametric, plain text, diffable. The STL is what falls out the
other end. Need it 8&nbsp;mm wider? Change a number, re-render, print.

## What's actually in there

It started with a set of sticker-holder inserts. There are a dozen models now, and looking at
the list, most of them exist because something on a bench or a desk annoyed me:

- **Bench cleaning station** — Gridfinity cups and bins for the IPA corner. Aerosols, wash
  bottle, dispenser pump, melamine sponges, all of it standing up instead of falling over.
- **Rotary tool station** — a vertical cup for a mini rotary tool plus a drilled block for
  its bits. It ships with a print-first hole-fit gauge, because guessing a friction fit and
  then printing the real thing is how you make two of them.
- **OWON SPM8104 top tray** — clamps onto the bench supply and holds the cord and barrel
  adapters in ten cells. Screw-clamp rails, no adhesive, nothing permanent done to the
  instrument.
- **ENGINDOT Shortkiller topper** — puts the short-finder on top of the bench supply where
  you can read it and reach the buttons, with the leads in a bucket behind it rather than
  draped across everything.
- **VJ rig stand** — iPad cradle for TouchOSC, trackpad tray, cable holder. The one thing
  on the list that isn't electronics.

Plus drybox stands, cord organizers, cable clamps, syringe holders, a UV mask station, and
a donation QR stand whose codes you regenerate for your own links, since a QR stand with my
Venmo on it isn't much use to you.

## The part I'd steal

Two bits of the setup have earned their keep more than any individual model.

**Every model releases independently.** Push a `<model>/v1.2.0` tag and CI renders that
model's STLs and a preview and publishes them as a GitHub release. So you don't need
OpenSCAD to use any of this — grab the STL. But the source is right there when you do want
to change something.

**CI validates the geometry.** On every pull request, everything re-renders and each mesh
gets checked for being watertight and 2-manifold with a sane bounding box. Parametric models
fail in a specific, nasty way: you tweak a variable, the preview looks fine, and the mesh is
quietly self-intersecting. You find out at the printer, four hours in. Now that fails the
build instead.

## Licensing, briefly

Two licenses, because there are two kinds of thing in the repo. The models are CC BY-NC 4.0
— share and remix with attribution, just not commercially. The parametric library and the
build tooling are MIT, because [Creative Commons themselves recommend
against](https://creativecommons.org/faq/#can-i-apply-a-creative-commons-license-to-software)
using CC licenses for software; they don't address source versus object code and carry no
patent grant. Every source file has an SPDX header so the split travels with the file if you
vendor it.

Designed on a Snapmaker U1, but almost none of it depends on that. Take what's useful.
