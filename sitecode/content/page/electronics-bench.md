---
title: The Bench
subtitle: The gear behind the work
comments: false
---

Good board work needs the right tools — you can't reflow a BGA or chase a short with a
soldering iron and hope. Here's what's actually on the bench, by job. Most of it is the
cheap-but-right tier rather than the name-brand tier, on purpose: this is a bench that has
to earn its upgrades.

*Some of the links below are affiliate links. They cost you nothing extra, and a little
comes back to the bench if you buy through them. Nothing here is listed because of the
link — it's listed because it's on the bench.*

### Optics
- **Trinocular stereo zoom microscope** — 3.5×–90×, double-arm boom, 56-LED ring light. The
  real microsoldering rig: stereo depth for hand work, and a third port for the camera.
- **BTER 4K trinocular camera** — plain UVC over USB-C, straight into OBS with no vendor
  software in the chain. The scope feed on stream is this.
- **Sipeed T256s thermal camera** — 256×192 LWIR with a 5 cm macro focus, raw Y16 over USB.
  Registered onto the scope image by [benchhud](/page/benchhud/), so the part that's cooking
  lights up on the board. Held by a [printed clamp](/page/3d-printer-models/) on the ring
  light.
- **Andonstar AD210** — standalone 10" LCD microscope. Inspection only, no video out.

### Heat
- **{{< amzn B07RNL7YT9 "YIHUA 948-II" >}}** — 4-in-1 rework station: hot air, iron, desolder
  gun, vacuum pickup. The desolder gun is the part that gets used more than you'd expect.
- **A full soldering station** alongside it, plus ceramic tweezers for hot-air work
  (non-conductive, heat-safe) and a beater pair of ESD tweezers for everything rough.
- **Foil tape and kapton** for shielding neighbours during rework — aluminium shields,
  copper sinks, and the adhesive is the real temperature limit.

### Measurement and short-hunting
- **OWON SPM8104** — bench PSU and DMM in one box, 0–80 V / 10 A, with SCPI over USB. This is
  what feeds a laptop 19 V with a current limit and what benchhud reads for the on-screen
  meter.
- **HR1520 injection box** — the short-killer. Inject current into a dead rail, watch the
  thermal camera find the part that's eating it.
- **{{< amzn B09KMS74PT "YEAPOOK ADS1014D" >}}** — 100 MHz two-channel scope with a DDS
  signal generator built in.
- **DSLogic Plus** — 16-channel logic analyzer, native on Linux and macOS via DSView.
- **FNIRSI LCR-P1** — component tester for the "what is this and is it dead" question.
- Two AstroAI true-RMS multimeters, and a test-lead kit with hooks, tweezers, and needle probes.

### Programming and retro
- **XGecu T48** with the adapter bundle — EEPROM and ROM programmer, driven by `minipro`
  from the command line. No Windows required.
- **Jonard IC extractors** for DIPs, and a Gamebit driver for NES, SNES, N64, and Sega carts.

### Power
- **Mean Well LRS-350-12** — 12 V / 29 A, the primary bench supply, in its own printed pod.
- **{{< amzn B099S4QP3T "ENGINDOT 30 V / 5 A" >}}** — the secondary adjustable supply, wearing
  the [Shortkiller topper](/page/3d-printer-models/).
- A 41-tip DC barrel adapter kit for feeding laptops from the bench supply, and a
  home-made banana-to-barrel master cord because the kit ships with no male barrel.

### BGA and pad repair
- **Magnetic reballing station** with a stencil library, **Sn63/Pb37** paste as the default
  and **Sn42/Bi58** low-temp for heat-sensitive boards.
- **Copper pad and trace repair kit**, **UV-curable green solder mask**, and a 365 nm lamp
  to cure it. The mask lives in a [printed opaque rack](/page/3d-printer-models/) because
  ambient light skins it.

### Hand tools and the rest
- A 142-piece precision driver set, a self-adjusting Klein stripper, a HARDELL rotary tool
  with its own printed station, ferrule and Dupont crimpers, calipers, an ESD mat and
  strap, and a heat-resistant silicone work mat.
- **GMKtec G11 mini PC** — the Linux bench host that runs benchhud, behind a self-powered
  10 Gbps USB hub so the scope camera, thermal camera, and capture box don't fight over bus
  power.
- **Snapmaker U1** — the printer that made the fixtures holding all of the above. See
  [3D Printer Models](/page/3d-printer-models/) and [Snapmaker U1 tooling](/page/snapmaker-u1-tooling/).

### Custom tooling
The bench also runs software I'm building for it. [benchhud](/page/benchhud/) pulls the
microscope feed, the thermal camera, and live instrument readings into one heads-up display —
so a component's heat bloom labels the component, and the meter reading sits right next to
the work instead of across the desk. [bench-parts](/page/bench-parts/) is the inventory
behind it, and [benchhud-intake](/page/benchhud-intake/) is the front door.
