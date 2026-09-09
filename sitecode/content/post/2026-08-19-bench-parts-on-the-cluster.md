---
title: "bench-parts Is on the Cluster"
subtitle: "The inventory service went from an API with a plan to an app the bench actually runs on"
date: 2026-08-19T22:30:00-07:00
tags: [ "benchhud", "electronics", "self-hosted", "kubernetes", "python", "projects" ]
---

# From "has an API" to "on the bench"

When I described the bench stack [last week](/post/2026-08-10-bench-stack-privacy-boundary/),
[bench-parts](/page/bench-parts/) was the quiet one: the inventory service whose REST API
[benchhud](/page/benchhud/) reads so stock shows up on the HUD. It had a schema, a
movements ledger, and a plan. This week it became an app, and then it became a pod.

## What landed

In roughly the order it shipped:

- **A real web UI** — catalogue with search and status colours, add-a-part, a detail page
  with edit and movement history, and restock / consume / correct controls. Then a
  tablet-and-phone styling pass, because the bench runs it on a tablet and the count
  column was off-screen at 375px. Found by looking, not by a test — noted.
- **Auth** — every route behind a session, CSRF on every form, login throttling. Password
  hashing and the rate limiter went in as tested modules first, then the gate.
- **The API** — a parts projection, read endpoints, and a consume endpoint. This is the
  half benchhud and intake talk to, and it's deliberately consumer-agnostic: a dashboard or
  a shell script could hit the same endpoints with no server-side change.
- **Delete and retire**, a **project field** with filters and chips, filament and module
  **categories**, and the schema migrations to carry each of them.
- **A to-order page** grouped by supplier, with bulk-add text and received-from-row —
  the thing you check before a supplier run instead of discovering the gap mid-repair.
- **An activity page** with per-job spend, and a full **CSV export** of both parts and
  the movements ledger, because your data should be able to leave.
- Migrations now also run **at startup**, so a broken one fails the pod at boot instead of
  on the first click. Belt, then braces.

That's 585 tests, every feature landing as a failing test first. The commit log reads
`test: add failing tests for X` → `feat: X`, over and over, and I've stopped being
embarrassed about how boring that looks.

## Then Flux picked it up

The manifests went into the cluster repo with image automation, so a merge to `main`
builds a multi-arch image, CI asserts the published manifest actually advertises
`linux/arm64` (an amd64-only build is invisible until the pod refuses to schedule), and
Flux rolls it onto the Raspberry Pi cluster. It got a MetalLB address on the LAN and it's
been the bench's system of record since.

One thing the deploy turned up: a LAN sweep found a phone sitting on an address *inside*
the MetalLB pool. The router's DHCP range overlaps it. Most routers conflict-check before
leasing and MetalLB answers ARP for what it owns, so the risk is modest — but it's not
zero, and it's the sort of thing that would take a very confusing afternoon to find later.
Deployed anyway, filed, fixing eventually. Honest.

## The boundary held

None of this changed the rule that shaped the service in the first place: **no customer
data lives here.** Consumption links to a job by reference string only; this service never
calls intake to resolve who the job is for. That's what lets benchhud put "low on IRF7910"
on a live stream without ever being able to put a customer's name next to it.

Source is still private for now. Builds will show up on the [project page](/page/bench-parts/)
as downloads while I settle how the source gets shared.
