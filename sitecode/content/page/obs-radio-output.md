---
title: obs-radio-output
subtitle: Stream straight to internet radio from OBS
comments: false
---

### Links
- Download: [Releases](https://github.com/Tech-Noid-Systems/obs-radio-output/releases) — signed builds for macOS, Linux, and Windows
- GitHub: [github.com/Tech-Noid-Systems/obs-radio-output](https://github.com/Tech-Noid-Systems/obs-radio-output)
- Part of: [Tech-Noid Systems](/page/tech-noid-systems/)

### About
obs-radio-output is a native OBS Studio output plugin that streams audio straight to an
Icecast or SHOUTcast server — no separate broadcast software sitting in the chain. It's
the replacement for BUTT (Broadcast Using This Tool): instead of routing OBS into a second
app and hoping the two stay in sync, the stream leaves OBS directly.

It's a [Tech-Noid Systems](/page/tech-noid-systems/) project — the tooling behind the TNS
radio feed and streams. Now in **public beta** across macOS, Linux, and Windows, with
signed and notarized builds you can download from the releases page. Windows can stream as
of the latest beta — it's a testing build, so if you run it there, feedback helps.

Written as a proper native plugin: async connection so the OBS UI never beach-balls on a
slow TLS handshake, MP3/Opus/Vorbis codecs, and TLS to the server.
