---
title: "A Programmer GUI That Isn't Windows-Only"
subtitle: "burnwright — a desktop app for XGecu chip programmers, on macOS, Linux, and Windows"
date: 2026-11-16T09:00:00-08:00
tags: [ "electronics", "repair", "burnwright", "rust", "tauri", "projects" ]
---

*Update, November 20: the device screen landed that same night — chip picker, read,
verify, write, and erase, all in the app. It still hasn't touched a real chip, so
[the project page](/page/burnwright/) has what's new and how to help test it.*

# The chip on every board

A lot of board repair ends at a flash chip. A laptop that won't POST after a bad BIOS
update, a GPU with a corrupted VBIOS, a retro machine with a ROM that's started dropping
bits — the fix is to pull the chip (or clip onto it), read it, and write a good image back.
The tool for that is a universal programmer, and on most benches that means an XGecu: the
TL866II+, the T48, the T56, now the T76.

The hardware is great. The vendor software is closed and Windows-only.

There's an open-source answer already: [minipro](https://gitlab.com/DavidGriffith/minipro),
a command-line engine that talks to these programmers on anything. It's what's been driving
the T48 on my bench. But a CLI is a rough fit for the moment you actually need it — a board
half-apart under the microscope, a chip ID you're squinting at, and a flag you have to get
right the first time because the wrong one erases the only copy.

**So I built the GUI: [burnwright](/page/burnwright/).**

## What it is

A Tauri desktop app — Rust underneath driving minipro and parsing its progress output, a web
frontend for the screens. Releases ship a macOS `.dmg` (Apple Silicon and Intel), a Linux
`.deb` and `.AppImage`, and a Windows installer. Each one carries its own build of minipro and
its chip databases, so there's nothing else to install, and GPL-3.0 because minipro's library
is.

It's early, and I'd rather be clear about where:

- **Detection works, and it explains itself.** When it can't find a programmer it says why —
  USB permissions on Linux, out-of-date firmware, or the T76 problem below — and gives the fix.
- **There's a hex editor**, virtualised so a big image doesn't choke it, with raw binary and
  Intel HEX load and save.
- **Read, write, verify, blank check, and erase work in the engine**, along with listing,
  searching, and describing every chip minipro knows. The screen that puts them in front of
  you is the next thing landing.

## The T76 on Apple Silicon

The most interesting bug so far isn't in my code. On an Apple Silicon Mac, a T76 on a USB 3
cable links at 5 Gb/s, shows up in System Information looking perfectly healthy, and then
never answers a single command. minipro reports "No programmer found," which is technically
true and completely unhelpful.

The cause is USB 3 link power management. The T76's controller misses a wake handshake that
Apple's USB host insists on, and macOS gives you no switch to turn that off for one device.
Linux and Windows hosts are more forgiving. **The fix is to make it a USB 2.0 device** — a USB
2.0 hub or a USB 2.0-only cable, and it links at 480 Mb/s and just works.

burnwright checks for exactly that: when detect comes back empty and there's a T76 sitting on
a USB 3 link, it tells you, with the fix. That's the kind of thing I want the whole app to
do — not just run the command, but tell you what the failure actually means.

## Where it goes

The device screen — chip picker, read, verify, write, erase — is next, and it's the one that
turns this from "a nicer way to see your programmer" into "the way I flash chips." After that
it's the T76 itself, which needs a newer minipro build than the one bundled today.

[The source and the installers are on GitHub.](https://github.com/IamMrCupp/burnwright) If you
own one of these programmers and you're not on Windows, give it a try and tell me what breaks.
