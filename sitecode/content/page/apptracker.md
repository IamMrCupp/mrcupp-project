---
title: apptracker
subtitle: Job-hunt tracking that lives in your cluster, not a browser tab
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/apptracker](https://github.com/IamMrCupp/apptracker) (MIT)
- Image: `ghcr.io/iammrcupp/apptracker` (linux/amd64, linux/arm64)

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
  be able to leave. A replace-all import asks first.
- **Optional single-password auth** with signed cookie sessions and a lockout after
  repeated failed logins. Runs open by default — set `APP_PASSWORD` when it's reachable by
  anything but you.
- **One file to back up.** That's the whole disaster-recovery plan.

### Who to chase today
That's the central question of a job search, and the follow-up date was already in every
entry. Now the app answers it: a **Needs follow-up** filter, and any row whose date has
arrived is highlighted. Past 50 entries, scrolling stops working, so there's live search
across every field and sortable columns too.

### Capture from the posting
A bookmarklet captures a posting straight off the page into a prefilled entry — the tedious
part of the loop, gone. A second one, **Capture (via LinkedIn)**, also fills in the channel
and marks it applied, for the usual path: find the role on LinkedIn, apply on the company's
own site, capture from there. It waits for job sites that load their data late instead of
giving up and grabbing the page title. And capturing the same posting twice gets a warning
naming the entry you already have — a warning, not a block, because a second round is real.

### Running it
Kustomize manifests and a Flux example are in the repo, with a SOPS-encrypted secret for the
password and session key. It runs as one replica on purpose — SQLite has exactly one writer,
so an update never starts a second pod against it. The same binary also runs as a desktop
app: it keeps its database in your OS's app-data folder and can open a browser at startup.
