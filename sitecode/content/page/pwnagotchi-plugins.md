---
title: pwnagotchi plugins
subtitle: Two small plugins for the jayofelony image
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/pwnagotchi-plugins](https://github.com/IamMrCupp/pwnagotchi-plugins)

### About
A [pwnagotchi](https://pwnagotchi.org/) is a Raspberry Pi Zero with an e-ink face that
wanders around collecting Wi-Fi handshakes and gets visibly happier the more it finds. It's
a security-research toy with a personality, and it's easy to get attached to. These are the
two plugins I run on mine, built against the jayofelony image — the current maintained fork,
which dropped the original "AI" so the Wi-Fi firmware stops falling over.

- **agev3** — the jayofelony image lost the calculated Age readout, and a pwnagotchi
  without an age is just a Pi. This one derives a birth date by stat'ing a few files the
  image writes on first boot, stores it as a small JSON blob, and puts Age back on the
  face.
- **hashieclean** — a refactor of an older community plugin for Python 3.11. It converts
  captured handshakes to hashcat's `.22000` (EAPOL) and `.16800` (PMKID) formats and clears
  out the "lonely" pcaps that can't convert to either — the ones that make boot slower
  every day you carry the thing around.

Both install through the stock plugin manager: add the repo to `custom_plugin_repos`, run
`pwnagotchi plugins update`, enable. Details in the README.
