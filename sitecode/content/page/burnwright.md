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
It's early, but there's a real screen now:

- **The device screen.** Pick the programmer and the chip from minipro's list, then read,
  verify, blank-check, erase, or write it. Progress and cancel on every operation, a
  confirmation that names the chip before anything gets erased or written, and a log of
  every minipro command it ran.
- **Detects a programmer — and explains when it can't.** USB permissions on Linux, firmware
  that's out of date, and the T76 on a USB 3 link all get named, with the fix. An all-ones
  or all-zeros chip ID gets called what it usually is: no chip in the socket.
- **A hex editor**, virtualised so a big image doesn't choke it. Raw binary and Intel HEX
  load and save, and it asks before a read you never saved gets thrown away.
- **Linux udev rules** ship with the `.deb`, so a plugged-in programmer just works. The
  AppImage needs them copied in once.

**One honest caveat:** all of that is tested against a fake minipro. burnwright hasn't read
or written a real chip yet, so treat a write as unproven until it has. It's main (code)
memory only for now — no EEPROM data memory, no fuses.

### Help test it
If you own one of these programmers and have a chip in a drawer, a read can't hurt it:
read the chip with Xgpro or the minipro command line, read it again with burnwright, and
compare the two files. Then file a
[hardware test report](https://github.com/IamMrCupp/burnwright/issues/new?template=hardware-test.yml),
pass or fail. [The testing guide](https://github.com/IamMrCupp/burnwright/blob/main/docs/testing-on-hardware.md)
says when a write test is safe, and
[the tested-hardware table](https://github.com/IamMrCupp/burnwright/blob/main/docs/tested-hardware.md)
is where each confirmed chip goes, with your name on it. It's empty right now. Yours could
be the first row.

### What's next
**Open-source EC flashing for laptop repair**
([#36](https://github.com/IamMrCupp/burnwright/issues/36)). Reflashing a laptop's embedded
controller in-circuit means a closed, Windows-only jig today. The plan is pluggable backends
behind the same screens — flashrom over EDI for the ENE KB9012 family, the open ITE
toolchain for ITE parts — with a backup forced before every write.

The groundwork is on main. The engine has a backend layer now, and every read and write
goes through it, with a rule that a write needs a backup first. That backup is two reads that
have to match on an in-circuit chip, saved with a hash and checked back. A chip in the socket
can still skip it after you confirm, which keeps today's minipro behaviour. An EC can't skip
it at all — a half-written EC is a board that won't start.

### The T76
The T76 runs on its own bundled build of minipro, newer than the one the other programmers
use. It hasn't been through the app on a real T76 yet.

It also needs a file burnwright won't give you. The T76 keeps no chip support of its own —
before every operation, minipro loads the bitstream for that chip family from
`algorithm.xml`, and those bitstreams are XGecu's, out of the Xgpro package. So you bring
your own copy: choose it once in the Programmer panel and burnwright hands it to minipro on
every T76 operation. Without it, burnwright still finds the T76 and searches its chip list,
and it tells you up front why an operation will fail, before anything is read or written.

And one finding worth repeating: on Apple Silicon Macs the T76 only answers over USB 2.0. On a
USB 3 cable it links at 5 Gb/s, shows up in System Information, and then never answers a
command. The cause is USB 3 link power management — the T76 misses a wake handshake that
Apple's USB host insists on. The fix is a USB 2.0 hub or a USB 2.0-only cable, and
burnwright tells you so when it sees the symptom.
