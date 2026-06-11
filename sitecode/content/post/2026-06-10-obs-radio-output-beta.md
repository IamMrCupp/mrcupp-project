---
title: "obs-radio-output Hits Public Beta"
subtitle: "Download it, install it, stream — no more building from source"
date: 2026-06-10T23:00:00-07:00
tags: [ "tech-noid", "obs", "streaming", "icecast", "projects" ]
---

# Radio Output is out in the world

Back in May I mentioned [obs-radio-output](https://github.com/Tech-Noid-Systems/obs-radio-output)
was brewing under Tech-Noid Systems — a native OBS plugin that streams audio straight to
Icecast and SHOUTcast, so you can drop [BUTT](https://danielnoethen.de/butt/) and stop
babysitting a sidecar on stream night.

Back then the only way to run it was to build it from source. Not anymore.

**The first public beta — `0.2.0-beta1` — is up, with real downloads.** Grab a
[signed, notarized macOS `.pkg`](https://github.com/Tech-Noid-Systems/obs-radio-output/releases/tag/0.2.0-beta1)
(installs clean, no Gatekeeper fight) or a Linux `.deb`, drop it in, and you've got a Radio
Output sitting right alongside OBS's built-in outputs.

What's working today:

- **macOS and Linux are ready to broadcast.** Configure under Tools → Radio Output, go live
  from the dock.
- **Icecast 2.x and SHOUTcast v1**, encoding in MP3, Opus, or Ogg/Vorbis — pick your protocol
  and codec.
- **Live listener count** in the dock, **auto-reconnect** on dropped connections, and
  color-coded status so you can tell at a glance whether you're actually on air.
- **Now Playing metadata** and **remote control over obs-websocket**, if you want to drive it
  from somewhere else.

The honest caveat: the **Windows build loads in OBS but can't stream yet** — libshout under
MSVC is fighting me ([#37](https://github.com/Tech-Noid-Systems/obs-radio-output/issues/37)).
Mac and Linux first; Windows is next.

New to it? The
[User Guide](https://github.com/Tech-Noid-Systems/obs-radio-output/blob/0.2.0-beta1/docs/USER-GUIDE.md)
takes you from install to your first broadcast. Hit a bug?
[Open an issue](https://github.com/Tech-Noid-Systems/obs-radio-output/issues/new/choose) — it's
a beta, and that's exactly what beta feedback is for.

GPL-2.0, community plugin, not affiliated with the OBS Project. It's already handling the job
on my own rig — now it can handle yours too. :)
