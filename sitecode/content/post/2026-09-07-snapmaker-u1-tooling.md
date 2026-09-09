---
title: "The Printer Has a Linux Box in It"
subtitle: "Snapmaker U1 firmware tooling, RFID diagnostics, and an iOS app for spool tags"
date: 2026-09-07T20:00:00-07:00
tags: [ "3d printing", "snapmaker", "firmware", "ios", "projects" ]
---

# Once you can SSH in, things become fixable

Every model on the [3D models page](/page/3d-printer-models/) comes off a Snapmaker U1 — a
four-toolhead colour printer with a small Linux computer inside it running the motion
control and the touchscreen. Stock firmware keeps that computer closed. The community
firmware from paxx12 opens it: SSH, debug features, extra capabilities. I've been building
against it since the winter and never put any of it on this site, so here's the shelf.

## Custom filament profiles on the touchscreen

The U1's GUI is a compiled binary with the filament profile list baked into it. Load a
third-party PETG and the screen calls it "Generic" no matter what you tell it. The
[helper scripts](/page/snapmaker-u1-tooling/) analyze that binary, patch new profile strings
in — or, the safer route, replace existing ones in place, same length, no relocation — and
verify the result before you flash it. It's binary surgery with a checklist. Back up the
original first; that isn't a formality.

## When spool detection lies

The U1 reads an NFC tag on the spool to configure itself. When that stops working, the
printer tells you approximately nothing. So there's a set of diagnostics that run over SSH:
dump what the reader actually sees, trace the NTAG215 read path, compare the RFID modules,
confirm which firmware features are live. Boring, and exactly what you want at 11pm when
the spool won't register.

## Write the tags from your phone

The other side of that: an [iOS app](https://github.com/IamMrCupp/OpenSpool-Filament-NFC-Tag-Generator-iOS-App)
that writes [OpenSpool](https://github.com/spuder/OpenSpool)-format tags with the **full
extended field set** the U1 understands under the community firmware — material, colour,
nozzle and bed temps, diameter, weight. Save a profile per filament, hold a blank NTAG215
to the phone, stick it on the spool. The printer configures itself when the spool goes in.
Every spool on the bench has one now.

## One proposal upstream

Printers that live on a LAN with no route out still have a cloud agent polling DNS,
forever. I've proposed a persistent, update-surviving toggle for it to the community
firmware. It's a small change; the point is that it survives the next firmware update
instead of being something you redo by hand.

---

None of this is affiliated with Snapmaker, and all of it can brick a printer if you skip
the backup step. Links and the full rundown are on the
[project page](/page/snapmaker-u1-tooling/).
