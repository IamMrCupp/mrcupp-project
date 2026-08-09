---
title: "apptracker: Job Hunting Without the Spreadsheet"
subtitle: "Self-hosted, syncs everywhere, one file to back up"
date: 2026-08-08T09:00:00-07:00
tags: [ "apptracker", "go", "self-hosted", "sqlite", "projects" ]
---

# Job hunting is a state management problem

Nobody tells you this part. The interviews are the hard bit emotionally, but the thing that
actually grinds you down is the bookkeeping — who you applied to, when, through what channel,
which recruiter said what, who you owe a follow-up, which of the four roles at the same
company you're actually in the pipeline for.

Most people do it in a spreadsheet. I did too, for a while.

There are good browser-based trackers for this. The one I liked kept everything in local
storage, which is genuinely great for privacy and genuinely bad the moment you open your
laptop instead of your desktop and none of it is there. Clear the wrong thing and it's gone
entirely.

So I built [apptracker](https://github.com/IamMrCupp/apptracker): same idea, real database,
running on my own cluster. **Your data, your box, every device.**

## What it is

A single static Go binary with the web UI embedded — nothing external to serve, nothing to
build at deploy time. It runs on SQLite through the pure-Go driver, so there's no CGO and
the container image is distroless and tiny.

Two modes, one table underneath. **Applications** tracks the roles: lane, company, role,
date, channel, comp, follow-up, status, link, notes. **Networking** tracks the people, with
the same shape pointed at contacts and conversations instead. Statuses run Draft → Applied →
Screening → Interviewing → Offer → Rejected → Ghosted, and yes, Ghosted needed to be a
first-class status.

A few deliberate calls:

- **Import and export in JSON and CSV**, full-snapshot round-trip. If you can't get your
  data back out, it isn't yours. That's the whole complaint that started this.
- **Auth is optional.** It runs open by default, because plenty of people want it on a
  laptop or behind a VPN and a login screen is friction for nothing. Set `APP_PASSWORD` and
  it wants a login. Set `APP_SESSION_KEY` too if it's long-running, or every restart logs
  you out.
- **One file to back up.** The SQLite database. That's the entire disaster recovery plan,
  and I'll take a plan I'll actually follow over a better one I won't.

## The newest bit

v0.4.0 adds a bookmarklet. You're on a job posting, you hit it, and apptracker opens with
the fields already filled from the page. That was the most tedious step in the loop — see
posting, switch tabs, retype the company and role and link — and now it's one click.

It's open source and it's boring in the way infrastructure should be. If you're in a job
hunt right now: good luck, genuinely. Track the follow-ups. That's the part that actually
moves things.
