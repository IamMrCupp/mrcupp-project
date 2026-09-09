---
title: Snapmaker U1 Tooling
subtitle: Firmware patching, RFID diagnostics, and an NFC tag writer for the printer behind the bench
comments: false
---

### Links
- Helper scripts: [github.com/IamMrCupp/SnapmakerU1-Firmware-Helper-Scripts](https://github.com/IamMrCupp/SnapmakerU1-Firmware-Helper-Scripts)
- OpenSpool NFC tag writer (iOS): [github.com/IamMrCupp/OpenSpool-Filament-NFC-Tag-Generator-iOS-App](https://github.com/IamMrCupp/OpenSpool-Filament-NFC-Tag-Generator-iOS-App)
- The community firmware this builds against: [paxx12's SnapmakerU1-Extended-Firmware](https://github.com/paxx12/SnapmakerU1)

### About
Everything on the [3D models page](/page/3d-printer-models/) comes off a Snapmaker U1 — a
four-toolhead colour printer with a small Linux box inside it. Stock firmware keeps that
box closed. The community firmware opens it up with SSH, and once you're in, a few things
that stock leaves alone become fixable.

- **Custom filament profiles on the touchscreen.** The U1's GUI is a compiled binary with
  the profile list baked into it, so a third-party PETG shows up as "Generic" no matter
  what you loaded. The scripts analyze the binary, patch new profile strings in — or, the
  safer route, replace existing ones in place — and verify the result before you flash it.
- **RFID / NFC diagnostics.** For when spool detection starts lying to you. Dump what the
  reader actually sees, trace the NTAG215 read path, compare the RFID modules, confirm
  which firmware features are live. Run over SSH on the printer.
- **OpenSpool tags from your phone.** An iOS app that writes
  [OpenSpool](https://github.com/spuder/OpenSpool)-format NFC tags with the full extended
  field set the U1 understands under the community firmware — material, colour, nozzle and
  bed temps, diameter, weight. Save a profile per filament, tap a tag to the phone, stick it
  on the spool, and the printer configures itself when the spool goes in. NTAG215 and
  NTAG216.

There's also a proposed change upstream to the community firmware: a persistent,
update-surviving toggle to stop the cloud agent polling DNS on a printer that lives on a LAN
with no route out. Small, but it's the kind of thing you want to survive the next firmware
update instead of redoing by hand.

Two warnings, both the usual ones: patching firmware can brick a printer, and none of this
is affiliated with Snapmaker. Back up the original binary before you touch it.
