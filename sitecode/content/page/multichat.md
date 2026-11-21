---
title: multichat
subtitle: Twitch and YouTube chat in one overlay, and one box to answer both
comments: false
---

### Links
- Fork: [github.com/IamMrCupp/megarohas_multichat](https://github.com/IamMrCupp/megarohas_multichat)
  (MIT)
- Upstream: [megarohas/megarohas_multichat](https://github.com/megarohas/megarohas_multichat)

### About
The bench streams to Twitch and YouTube at once, which means two chats. megarohas's
multichat already solved the reading half well: one small Node.js process on your own
machine merges both chats into a single OBS overlay — emotes from 7TV, BTTV, and FFZ, Super
Chats, subs and raids, and moderator deletions honoured. No API keys, no sign-in, no
dependencies. **All of that is megarohas's work.**

What it didn't do was answer. Replying meant two chat windows and remembering which one a
question came from.

### What the fork adds
- **A reply dock.** One page, docked in OBS, with the merged feed and one box. Pick Twitch,
  YouTube, or both, or click a chat line to answer on the platform it came from. The dock
  shows where each reply will go before you send it, refuses the send if that changed
  underneath you, and counts characters against the tighter limit of the chats you're
  aiming at.
- **No local echo.** Your reply shows up when the platform sends it back through the feed,
  so the dock never shows something your viewers didn't get.
- **A viewer-count bar** for both platforms on the overlay, skinnable.
- **Locked to this machine.** The fork listens on `127.0.0.1` by default, where upstream
  listens on the whole LAN. Even opened up, sending and the panel's controls only answer to
  the machine they run on.

Reading still needs no keys. Sending is optional per platform: Twitch needs a client ID
from your own Twitch app and a single permission, and YouTube needs your own Google Cloud
project, because sending has to go through the official API. Reading never touches that
quota.

Treat it as single-user software on a machine you trust — another program on the same
computer can still reach the send endpoint. Closing that gap is
[proposed](https://github.com/IamMrCupp/megarohas_multichat/issues/10), not built.
