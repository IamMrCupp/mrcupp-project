---
title: OpenBoardView
subtitle: Board-to-schematic cross-probing, finally working on macOS
comments: false
---

### Links
- Upstream: [github.com/OpenBoardView/OpenBoardView](https://github.com/OpenBoardView/OpenBoardView)
- My fork: [github.com/IamMrCupp/OpenBoardView](https://github.com/IamMrCupp/OpenBoardView)
- The contribution: [PR #363](https://github.com/OpenBoardView/OpenBoardView/pull/363)

### About
This one isn't mine — it's someone else's project I depend on, and a patch I wrote because
I needed it.

OpenBoardView reads `.brd` board files: tap a part, see its pins, nets, and neighbours. It's
the free replacement for the Test_Link and Landrex tools, and it's what sits open next to
the microscope while I'm tracing a fault. Its best feature is **cross-probing** — click a
designator on the board and the schematic PDF jumps to that part, and vice versa.

That feature did nothing on macOS. Not broken — unimplemented. The `#ifdef` chain had
branches for Linux and Windows and no branch for macOS, so it fell through to a base
`PDFBridge` class whose methods are all empty. Clicking PDF Search called into nothing and
returned. Silently.

My patch adds a macOS backend that drives [Skim](https://skim-app.sourceforge.io/) over
AppleScript — the same drive-an-existing-viewer model the Linux (Evince) and Windows
(SumatraPDF) backends already use. Skim was the right pick for the same reason those two
were: open source, maintained, and scriptable out of the box, so there's nothing to patch
upstream of the patch.

Both directions work. Click a part, Skim jumps to the designator and highlights it. Select
text in Skim, the matching part lights up on the board.

A couple of things that were more interesting than expected:

- **Reverse search has to poll.** Skim has no cross-process signal for "the selection
  changed," so a background thread checks. It writes to a mutex-guarded value the render
  loop only ever compares, so nothing blocks.
- **The poll has to wake the render loop.** OpenBoardView stops calling `Update()` once
  it's been idle a while — without an `SDL_PushEvent` nudge, a selection made in Skim
  wouldn't show up until you touched the mouse.
- **The missing entitlement reproduced the original bug exactly.** Without
  `NSAppleEventsUsageDescription` in the bundle plist, the automation events fail silently
  and the button does nothing. Same symptom, different cause.

Open upstream since July 2026. Running on my bench in the meantime.
