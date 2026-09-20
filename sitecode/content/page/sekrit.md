---
title: sekrit
subtitle: Open, self-hostable event ticketing for promoters who don't want a walled garden
comments: false
---

### Links
- Source: private while it's pre-alpha. Intended to be open source.

### About
shhh… sekrit is an event and ticketing platform for independent promoters and underground
scenes. You host it; promoters run their own events on it. It exists because every platform
in this space sells the same thing — scarcity. Invite trees, lotteries, locked lists — and
then keeps the two things a promoter actually needs: the attendee list you show a venue to
prove your draw, and control of your own money.

sekrit inverts that. Two rules, and every feature gets checked against both:

- **No gatekeeping.** Public events are open to anyone with the link. No invite codes, no
  lottery, no approval queue, no artificial scarcity. A room holds what it holds, and the
  capacity shown is the real one.
- **Your money never touches the platform.** Attach your own payment links — Venmo, Cash
  App, PayPal, a Stripe link, whatever the door already runs on — and the platform renders
  the buttons. Later, connect your own Stripe account for verified checkout that settles
  straight to you. There is no code path where funds land in a platform account and get
  paid out. The platform is never in the flow of funds.

And the third thing, which is really the point: **you own your list.** Every promoter's
contact list is theirs, exportable to CSV any time. That's a first-class feature, not a
retention hostage.

What v1 covers: organizer accounts, events with ticket tiers, a public event page that
previews properly when you paste it into a chat, RSVP → ticket → QR in one step with no
attendee account, bring-your-own-sink payments, a door list and a mailing list you can pull
as CSV, and a check-in app that works on two phones and a printed QR. Integrated checkout,
add-ons, promo codes, and refunds come after that ships.

FastAPI and PostgreSQL behind, Next.js in front, deployed to the same Kubernetes cluster
as everything else here via Flux. Built for the NorCal bass scene first — it's the one I'm
in — and generalizable after.

Pre-alpha. It gets a real page and a public repo when there's something to put a QR code
on.
