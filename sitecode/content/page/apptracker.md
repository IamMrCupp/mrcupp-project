---
title: apptracker
subtitle: Job-hunt tracking that lives in your cluster, not a browser tab
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/apptracker](https://github.com/IamMrCupp/apptracker)

### About
Job hunting generates a surprising amount of state — who you applied to, when, through what
channel, who you talked to, what you promised to follow up on. The good browser-based
trackers hold all of it in local storage, which means it lives on one machine and dies with
the profile.

apptracker is the same idea backed by a real database, self-hosted. Your data sits in your
cluster and follows you to every device you log in from.

- **One static Go binary** with the web UI embedded — nothing external to serve.
- **Pure-Go SQLite** (`modernc.org/sqlite`), so no CGO and a tiny distroless image.
- **Two modes** — Applications and Networking, one table discriminated by kind. Lane,
  company or contact, role, date, channel, comp, follow-up, status, link, notes.
- **JSON and CSV import/export** with a full-snapshot round-trip, because your data should
  be able to leave.
- **Optional single-password auth** with signed cookie sessions. Runs open by default —
  set `APP_PASSWORD` when it's reachable by anything but you.
- **One file to back up.** That's the whole disaster-recovery plan.

Latest release adds a bookmarklet that captures a posting straight off the page into a
prefilled entry — the tedious part of the loop, gone.
