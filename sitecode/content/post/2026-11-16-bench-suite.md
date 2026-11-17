---
title: "One Install for the Bench"
subtitle: "The bench software goes public, picks up a fourth app, and learns to install itself"
date: 2026-11-16T12:00:00-08:00
tags: [ "benchhud", "electronics", "repair", "self-hosted", "packaging", "projects" ]
---

# The source question, settled

For most of this year the bench software had the same line on every page: *source private
for now, while I settle how it gets shared.* It's settled. **[benchhud](/page/benchhud/),
[benchhud-intake](/page/benchhud-intake/), and [bench-parts](/page/bench-parts/) are public
repos now**, under the PolyForm Small Business license.

That license is a deliberate middle ground. It's free for individuals and for any shop under
100 people and $1M a year — which is every independent repair bench I can think of — and it
asks for a commercial license above that. I wanted another one-person bench to be able to
pick this up, read it, change it, and run it without asking. I didn't want a chain to pick
it up and resell it. **Source-available, not open source** — and I'd rather say that plainly
than blur it.

## A fourth app: bench-recon

The bench does more than repair. Hardware, automotive, and IoT pentesting uses the same
scope and the same programmers, and it produces a very different kind of paperwork:
engagements, scope, written authorization, targets, findings, firmware dumps.

[bench-recon](/page/bench-recon/) is where that lives. It follows the
[same boundary as intake](/post/2026-08-10-bench-stack-privacy-boundary/), only stricter —
LAN-only, deny-by-default auth, an append-only findings log, and benchhud only ever sees a
ref-safe projection: a reference, a safe title, a target class, a status. Nothing that
identifies a client can reach the thing that composites to a stream. Its Debian package even
installs **dormant** — the service isn't enabled or started until you say so, because
nothing holding client data should run by accident.

## Four apps, one install

Four apps that talk to each other means four configs that need each other's URLs and API
tokens. Wiring that by hand on my own bench was fine. Asking someone else to do it is how a
project stays a "works on my bench" project forever.

So: [bench-suite](/page/bench-suite/).

```sh
sudo apt install bench-suite
sudo bench-setup
```

`bench-suite` is a metapackage. `bench-setup` asks for **one** password and sets it on every
service, mints each service's API token and writes it into benchhud's config, asks whether
to turn bench-recon on, and won't call the job done until every service answers. Run it
again and it only fixes what's missing — a service that already has a token keeps it, so a
re-run never cuts off something that's already using it. From a script the password comes in
on stdin, never in argv where `ps` would show it.

Every service listens on `127.0.0.1`. On a single bench box, benchhud talks to them locally
and nothing is reachable from the LAN unless you put it there. If you'd rather not install
service packages, `bench-setup services --compose` does the same wiring through Docker,
with the same loopback-only ports and bench-recon behind a compose profile so it never
starts by accident.

## Where it stands

The packages build, and CI installs all four apps on a clean Ubuntu 26.04 and runs the setup
end to end on every change. The last piece is the signed apt repo, which lives at
apt.yolorepair.com — the bench software and [the repair shop](/post/2026-11-16-yolo-electronics-repair/)
share a domain for a reason. A Homebrew tap covers macOS; Windows comes later.

If you run a bench and any of this sounds useful, the repos are open. Issues welcome.
