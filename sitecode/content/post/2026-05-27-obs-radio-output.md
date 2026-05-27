---
title: "obs-radio-output: OBS Straight to Icecast"
subtitle: "A native streaming plugin under Tech-Noid Systems"
date: 2026-05-27T14:05:00-07:00
tags: [ "tech-noid", "obs", "streaming", "icecast", "projects" ]
---

# Streaming radio straight from OBS

New project brewing under the Tech-Noid Systems umbrella:
[obs-radio-output](https://github.com/tech-noid-systems/obs-radio-output).

It's a native OBS Studio plugin that streams audio straight from OBS to Icecast /
SHOUTcast servers — so you can drop [BUTT](https://danielnoethen.de/butt/) (or whatever
sidecar you've been running) entirely. One less thing to babysit on stream night.

Where it's at:

- Native OBS output — shows up alongside the built-in outputs, configured inside OBS
- Icecast 2.x, with Opus and MP3 encoding (SHOUTcast is on the roadmap)
- Auto-reconnect on dropped connections, with a color-coded status dock
- Builds for macOS (universal), Windows, and Linux

It's still pre-release — you build it from source for now — but it's already handling
the job on my own rig. GPL-2.0, community plugin, not affiliated with the OBS Project.
