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
- **Linux udev rules** ship with the `.deb`, for the XGecu programmers and the CH341A, so a
  plugged-in programmer just works. The AppImage needs them copied in once.
- **Light and dark**, following the system or held to one. You can also drop your own
  colour themes into a folder as small JSON files.

**One honest caveat:** the chip side of all that is tested against a fake minipro. burnwright hasn't read
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

### Laptop ECs: backup first
Reflashing a laptop's embedded controller in-circuit means a closed, Windows-only jig today.
**Open-source EC flashing** ([#36](https://github.com/IamMrCupp/burnwright/issues/36)) is
the bigger goal, and the first piece is in: a second bench, **Laptop EC**, that backs one up
with the chip still on the board.

One chip so far — the ENE KB9012, over its EDI debug port, with a CH341A and
[flashrom](https://flashrom.org), which you install yourself. Look for the CH341A, identify
the chip, back it up. The backup reads the whole flash twice and only saves it if the two
reads match, because a read that wanders means a loose wire or an EC that's still running,
and a bad backup is worse than none. Before it'll talk to the chip, the bench makes you tick
off the wiring it can't check for you — including the common black CH341A, whose data lines
sit near 5 V whatever the jumper says. That can kill an EC.

**It reads. It doesn't write.** There's no button for it and no code behind one. Writing
waits until the backup is mandatory and proven, because a half-written EC is a board that
won't start. And like everything else here, nobody's run it on a real KB9012 yet — it's
tested against a stand-in that replays what flashrom prints.
[What you need, and the wiring](https://github.com/IamMrCupp/burnwright/blob/main/docs/ec-backup.md).

### On stream
burnwright is built for the same streamed bench as [benchhud](/page/benchhud/), so it can go
on air without showing what it shouldn't.

- **A stream page.** burnwright serves a small card for OBS to load as a browser source:
  the programmer, the chip, the operation, and a progress bar, on a transparent background
  that layers over a camera. It gets a fixed list of fields and nothing else — never a file
  path, the log, or the image. So the card says *that* a write failed, not why; the why
  stays in the app. Off until you turn it on, and it only listens on the same computer.
- **Hide file paths.** To capture the whole window instead, one switch makes every file path
  read `[hidden]` — in the log, minipro's and flashrom's command lines, error messages, and
  both benches.

The stream page follows the programmer bench for now; the Laptop EC bench isn't on it yet.

### What's next
Writing an EC, once a backup is proven on real boards, and more chips behind the same
screens, like the open ITE toolchain for ITE parts. The engine is ready for
it: every read and write already goes through one backend layer, with a rule that a write
needs a backup first. A chip in the socket can skip that after you confirm, which keeps
today's minipro behaviour. An EC can't skip it at all.

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
