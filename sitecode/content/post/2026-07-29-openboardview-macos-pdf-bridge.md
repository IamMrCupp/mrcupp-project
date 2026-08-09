---
title: "The Button That Did Nothing"
subtitle: "Board-to-schematic cross-probing on macOS, finally"
date: 2026-07-29T18:00:00-07:00
tags: [ "electronics", "repair", "macos", "open source", "openboardview" ]
---

# A silence worth chasing

When you're tracing a fault on a board, the two things you want side by side are the board
and its schematic. [OpenBoardView](https://github.com/OpenBoardView/OpenBoardView) does the
first half — open a `.brd` file, tap a part, see its pins and nets and neighbours. It's the
free replacement for the old Test_Link and Landrex tools, and it lives open next to my
microscope.

Its best trick is cross-probing: click a designator on the board and the schematic PDF jumps
to that part. Click a part in the schematic and it lights up on the board. Once you've
worked that way, going back to scrolling a PDF by hand feels like doing arithmetic on paper.

On my Mac, that button did nothing at all. No error, no beep, no log line. Click, nothing.

## Not broken — never built

The instinct with a silent failure is to assume something's crashing quietly. It wasn't. I
went looking and found the dispatch in `BoardView.h`: an `#ifdef` chain with a branch for
Linux, a branch for Windows, and no branch for macOS. Falling off the end landed on the base
`PDFBridge` class, whose methods are all empty.

So the click was calling into a function that does nothing and returning successfully. **It
wasn't a bug, it was an unimplemented platform backend** — which is a much better thing to
find, because it means nobody has to be wrong for you to fix it.

Linux drives [Evince](https://wiki.gnome.org/Apps/Evince), Windows drives
[SumatraPDF](https://www.sumatrapdfreader.org/). Neither reimplements a PDF viewer; they
just script one that already exists. macOS needed the same thing, and
[Skim](https://skim-app.sourceforge.io/) is the obvious candidate — open source, still
maintained, and scriptable out of the box. `find`, `selection`, `go`, and `obtain` cover
everything the bridge needs, so there's nothing to patch upstream of the patch.

## Three things that weren't obvious

Forward search was easy: build an AppleScript, run it, Skim jumps. The other direction took
some learning.

**Skim can't tell you when the selection changes.** There's no cross-process signal for it,
so the bridge polls on a background thread. That's not elegant, but it's what's available,
and it stays off the render loop — it writes to a mutex-guarded value the UI only ever
compares against, so nothing blocks waiting on a PDF viewer.

**Polling alone still wasn't enough.** OpenBoardView stops calling `Update()` once it's been
idle for a while, which is the right call for a desktop app that shouldn't spin your fans.
But it means a selection you make over in Skim doesn't get noticed until you touch the mouse.
The poll now pushes an `SDL_PushEvent` to wake the loop when something actually changed.

**And the entitlement reproduced the original symptom exactly.** Without
`NSAppleEventsUsageDescription` in the bundle plist, macOS refuses the automation events —
silently. Button does nothing. Same non-event as before, completely different cause. I lost
a while to that one before the plist occurred to me.

## Where it stands

It's up as [PR #363](https://github.com/OpenBoardView/OpenBoardView/pull/363), everything
macOS-specific behind a build guard so the Linux and Windows builds are untouched. Tested on
an M4 Pro against a real board and its matching schematic — click a part, Skim jumps to the
designator; select text in Skim, the part lights up on the board. Hands free.

It's open upstream and I'm not going to pretend I know when it lands. In the meantime it's
running on my bench every day, which is the whole reason it exists. If you're doing
board-level work on a Mac and you've been wondering why that button never did anything —
now you know, and there's a fix waiting.
