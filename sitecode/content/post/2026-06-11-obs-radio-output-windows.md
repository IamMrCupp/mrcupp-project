---
title: "obs-radio-output: Windows Can Stream Now"
subtitle: "First Windows testing build — libshout's done fighting me"
date: 2026-06-11T22:00:00-07:00
tags: [ "tech-noid", "obs", "streaming", "icecast", "projects" ]
---

# Windows joins the party

Last time I posted about [obs-radio-output](https://github.com/Tech-Noid-Systems/obs-radio-output),
the honest caveat was that the Windows build loaded in OBS but couldn't actually stream —
libshout under MSVC was fighting me ([#37](https://github.com/Tech-Noid-Systems/obs-radio-output/issues/37)).

It's not fighting me anymore.

**`0.2.0-beta2` is the first Windows build that can actually stream.** The full stack is there
now — libshout with TLS, plus the MP3, Opus, and Vorbis encoders — all compiled and linked on
Windows. Grab the
[windows-x64 zip](https://github.com/Tech-Noid-Systems/obs-radio-output/releases/tag/0.2.0-beta2),
drop the `obs-radio-output` folder into `%APPDATA%\obs-studio\plugins\`, and you've got a native
radio output in OBS on Windows.

One straight-up caveat, because that's how I run these: **I haven't verified it end-to-end on
real Windows hardware yet.** It builds, it links, the code paths are all there — but "compiles"
and "ran a live stream for an hour without dropping" are different claims, and I'm only making
the first one. So this is a *testing build*. Mac (signed + notarized) and Linux are still the
ones I'd point you to for real use.

If you're on Windows and you stream from it — **please kick the tires and tell me how it goes.**
There's a [feedback thread](https://github.com/Tech-Noid-Systems/obs-radio-output/discussions/110)
for exactly this; logs are gold. Bug reports are the whole point of a beta.

Still GPL-2.0, still a community plugin under Tech-Noid Systems, still not affiliated with the
OBS Project. Three platforms now — one of them just needs you to help prove it. :)
