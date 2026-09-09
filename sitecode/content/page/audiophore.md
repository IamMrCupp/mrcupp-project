---
title: Audiophore
subtitle: Synesthesia to your whole lighting rig
comments: false
---

{{< figure src="/img/audiophore-logo.png" class="project-logo" alt="Audiophore" >}}

### Links
- Website: [audiophore.dev](https://audiophore.dev)
- GitHub: [github.com/audiophore](https://github.com/audiophore)

### About
Audiophore is a low-latency bridge, written in Rust, that takes output from
[Synesthesia](https://synesthesia.live) VJ software and pushes it out to the wider
lighting ecosystem — so you can drive your whole rig from one place instead of stitching
together a pile of one-off integrations.

What it talks to:

- Philips Hue and WLED
- Art-Net / E1.31 fixtures
- Nanoleaf panels
- Ether Dream laser DACs
- OSC passthrough for anything else that speaks it

Under the hood it's a Rust engine with pluggable input adapters, Lua-scripted show files,
and a Tauri + Svelte native app on top. **Sub-30 ms from audio event to light is the
non-negotiable** — anything slower and the room notices before you do. The
[brand kit](https://github.com/audiophore/branding) is public too: logos, wordmark, and
palette, all regenerated from one `brand.toml`. There's even a printed enclosure for the
bench-side hardware, designed in OpenSCAD like everything else around here.

It's still pre-launch — [audiophore.dev](https://audiophore.dev) is a placeholder for now
— but the bones are there, it's under CI with fuzzed inputs and latency benchmarks, and
it's steadily turning into a real thing. Source-available under PolyForm Noncommercial.
