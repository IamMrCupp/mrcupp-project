---
title: bench-parts
subtitle: Self-hosted parts inventory for the repair bench
comments: false
---

### Links
- Source: private for now.

### About
Knowing you have the part is half of quoting a repair. bench-parts is the inventory that
answers it — stock levels, what got consumed on which job, and a **to-order list** you check
before a supplier run instead of discovering the gap mid-repair.

It has two faces, and neither depends on the other:

- **A standalone app** — a tablet-friendly web UI for the bench. Add a part, adjust a count
  when you restock or use something, check what's running low. Works fine with nothing else
  running.
- **A parts REST API** — deliberately consumer-agnostic. Any authorized client on the LAN
  can read stock and record consumption. [benchhud](/page/benchhud/) is the first consumer
  through an inventory adapter, but a dashboard or a shell script could hit the same
  endpoints with no server-side change.

The design constraint that shapes it: **no customer data lives here.** Parts are
stream-safe. That's what lets benchhud put inventory on the HUD — "you're on job 26-0001,
low on IRF7910" — while it's compositing to a live stream. Consumption links to a job by
reference string only, and this service never calls
[intake](/page/benchhud-intake/) to resolve it. The boundary is the point.

Python and FastAPI, SQLite, deployed to a Raspberry Pi cluster over Flux. Multi-arch images,
with CI asserting the published manifest actually advertises `linux/arm64` — an amd64-only
build is invisible until the pod refuses to schedule.

Source-available under the PolyForm Small Business License: free for personal use and small
shops, commercial license above that.
