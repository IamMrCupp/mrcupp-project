---
title: "Three Services, One Privacy Boundary"
subtitle: "The bench software split, and the streaming decision that forced it"
date: 2026-08-10T20:00:00-07:00
tags: [ "benchhud", "electronics", "repair", "architecture", "self-hosted", "kubernetes" ]
---

# When a feature decides your architecture

The bench runs three pieces of software I wrote:
[benchhud](/page/benchhud/) on the bench itself,
[bench-parts](/page/bench-parts/) holding inventory, and
[benchhud-intake](/page/benchhud-intake/) taking work in.

Three services for a one-person repair bench sounds like someone enjoying microservices a
bit too much. It isn't — or at least, it isn't only that. **The split is a privacy boundary,
and one feature drew the line.**

## The feature

benchhud composites everything on the bench into one window and pushes that composite out as
a virtual camera, so OBS can pick it up and I can stream a repair.

Work through what that means. Anything benchhud can display is potentially on a live stream.
Not "might be if I misconfigure something" — by design, the whole window is the broadcast.

Now consider what a repair shop's software normally holds. Customer name. Phone number.
Address. What they said was wrong with it. That data cannot be in a process whose entire job
is putting its screen on the internet. Not behind a "hide panel" toggle, not in a collapsed
sidebar, not one accidental drag away.

So it isn't in there. **Customer data lives in a separate service that benchhud can't
display, and benchhud stores only a reference pointing back to it.**

## Where the line ended up

**benchhud-intake** is the system of record for customer data. Tablet-friendly form at the
front, small REST API behind it, and benchhud reads it as a ticket source — so a job arrives
on the bench without anyone retyping a device model. It runs LAN-only and never gets a
public ingress, because that's what holding other people's contact details obligates you to.

**bench-parts** is the interesting counterpart, because it inverts the rule. It holds no PII
at all — parts, counts, what got consumed, what needs ordering. That data is *stream-safe*,
which is precisely why benchhud is allowed to put it on the HUD. "You're on job 26-0001, low
on IRF7910" is fine on a stream. The customer's phone number is not.

The linkage between them is deliberately thin: consumption records reference a job by string,
and bench-parts never calls intake to resolve it. It can't leak what it can't look up.

**benchhud** is the bench log. What's on the bench, what was measured, what the scope and
thermal cameras saw. Job references, not people.

The rule that falls out is easy to hold in your head, which is the main thing I wanted:
**if it identifies a person, it isn't in the process that streams.**

## The bit I'd have got wrong

I didn't set out to build three services. The first version of this was one app, and intake
was going to be a tab in it. The privacy problem only became obvious when I thought about
what actually happens the first time someone drops in while I'm streaming and I need to look
up their ticket on camera.

That's an argument for building the thing that produces the awkward scenario early. The
streaming feature is what made the requirement legible — a purely private bench tool would
have shipped as one app with everything in it, and it would have been *fine* until the day it
wasn't.

## Unglamorous notes from deploying it

Both services are Python and FastAPI on a Raspberry Pi cluster, GitOps'd with Flux. Three
things that cost me time:

**SQLite on NFS does not want WAL.** Both services run `journal_mode=TRUNCATE` with
`synchronous=FULL`. WAL on an NFS volume misbehaves, and its failure mode is corruption
rather than an error — which is the worst possible way for a storage layer to be wrong,
because you find out long after the decision.

**Exactly one writer.** Single replica, recreate strategy. Rolling updates briefly run two
pods, and two pods writing one SQLite file is how you get the corruption you just carefully
avoided.

**Assert the manifest, not the build.** Images are multi-arch, and the cluster is arm64. An
amd64-only image builds green, pushes green, and then the pod simply refuses to schedule with
a message you have to go digging for. CI now checks that the *published manifest* actually
advertises `linux/arm64` — the build succeeding was never the thing worth verifying.

Both are source-available under PolyForm Small Business: free for personal use and small
shops, commercial license above that.
