---
title: burnwright
subtitle: An open-source GUI for XGecu / MiniPRO chip programmers
comments: false
---

### Links
- Source: [github.com/IamMrCupp/burnwright](https://github.com/IamMrCupp/burnwright)
  (GPL-3.0-or-later)
- Downloads: [GitHub releases](https://github.com/IamMrCupp/burnwright/releases) — macOS
  `.dmg` (Apple Silicon and Intel), Linux `.deb` and `.AppImage`, Windows installer
- Write-up: [A Programmer GUI That Isn't Windows-Only](/post/2026-11-16-burnwright/)

### About
A universal programmer is how you read and rewrite the flash and EEPROM chips on a board —
a laptop's BIOS chip, a GPU's VBIOS, the ROMs in a retro machine. The XGecu line (TL866II+,
T48, T56, T76) is what most benches use, and the vendor software is closed and Windows-only.
The open-source [minipro](https://gitlab.com/DavidGriffith/minipro) engine already talks to
these programmers from the command line. **burnwright is the GUI on top of it** — macOS,
Linux, and Windows, no vendor software in the chain.

It's a Tauri app: a Rust backend that drives minipro and parses its progress, a web
frontend for the screens. Every installer ships its own build of minipro with its chip
databases, so there's nothing else to install.

### What works today
It's early, but it runs:

- **Detects a programmer — and explains when it can't.** USB permissions on Linux, firmware
  that's out of date, and the T76 on a USB 3 link all get named, with the fix.
- **A hex editor**, virtualised so a big image doesn't choke it. Raw binary and Intel HEX
  load and save.
- **Read, write, verify, blank check, and erase** work in the engine; the screen for them is
  the next big piece.
- **Linux udev rules** ship with the `.deb`, so a plugged-in programmer just works. The
  AppImage needs them copied in once.

### What's next
The screen for read, write, and verify comes first. After that, the bigger one:
**open-source EC flashing for laptop repair**
([#36](https://github.com/IamMrCupp/burnwright/issues/36)). Reflashing a laptop's embedded
controller in-circuit means a closed, Windows-only jig today. The plan is pluggable backends
behind the same screens — flashrom over EDI for the ENE KB9012 family, the open ITE
toolchain for ITE parts — with a backup forced before every write.

### The T76 on Apple Silicon
One finding worth repeating: on Apple Silicon Macs the T76 only answers over USB 2.0. On a
USB 3 cable it links at 5 Gb/s, shows up in System Information, and then never answers a
command. The cause is USB 3 link power management — the T76 misses a wake handshake that
Apple's USB host insists on. The fix is a USB 2.0 hub or a USB 2.0-only cable, and
burnwright tells you so when it sees the symptom.
