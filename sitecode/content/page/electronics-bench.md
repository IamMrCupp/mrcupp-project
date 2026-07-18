---
title: The Bench
subtitle: The gear behind the work
comments: false
---

Good board work needs the right tools — you can't reflow a BGA or chase a short with a
soldering iron and hope. Here's the shape of the bench, without the full parts list.

### What's on it
- **Optics** — a stereo microscope for fine-pitch inspection and rework. Most of the job
  is seeing clearly before you touch anything.
- **Heat** — hot-air rework, temperature-controlled soldering, and a preheater so big
  ground planes don't wick all the heat away from the joint.
- **Measurement** — bench multimeter and a programmable power supply, plus the diagnostic
  kit for finding shorts and reading what a board is actually doing.
- **Programming** — chip programmers and readers for firmware work and dumping EEPROMs.

### Custom tooling
The bench also runs software I'm building for it. [benchhud](/page/benchhud/) pulls the
microscope feed, a thermal camera, and live instrument readings into one heads-up display —
so a component's heat bloom labels the component, and the meter reading sits right next to
the work instead of across the desk.
