---
title: "annoybots: eggdrop Energy, Modern Stack"
subtitle: "The bots that ran every IRC channel in 2003, rebuilt in Go"
date: 2026-08-03T14:00:00-07:00
tags: [ "annoybots", "irc", "discord", "twitch", "go", "kubernetes", "projects" ]
---

# The bot in the corner of every channel

If you were on IRC in the early 2000s, you remember the bots. Eggdrop sat in the channel
keeping ops straight and rejoining when somebody kicked it. BMotion babbled semi-coherent
nonsense assembled from whatever the channel had been saying for the last hour, and
occasionally it landed a line so perfect everyone assumed a human typed it.

Both still exist. Both are also a TCL stack, and I am not spending my weekends maintaining
TCL in 2026.

So: [annoybots](https://github.com/IamMrCupp/annoybots). Same idea, written in Go.

## One binary, many bots

One small binary holds a pile of chat connections at once — IRC networks, Twitch, and
Discord — and routes every channel through a shared annoyance engine.

The design decision everything else hangs off: **personality is config, not code.** A bot is
a YAML file. Its name, its triggers, its voice, the channels it sits in, how often it butts
in unprompted — all of it is data. Want a second bot? New YAML file, new pod. You never fork
the code to get a different bot, which means all of them get every fix. The repo ships two
personalities, Echo and Mimic, to copy from.

## The babble still babbles

The Markov brain is the part I most wanted to get right, because it's the part people
actually remember. It's an order-N chain that learns from channel chatter and spits it back
mangled, and it persists to disk — so it survives a restart and keeps whatever weird dialect
your channel has taught it.

Around that:

- **Triggers and interjections** — keyword and regex triggers with randomized templated
  replies, plus unprompted ambient lines on a per-channel cooldown so it doesn't become
  wallpaper.
- **Games** — karma, `!roll`, `!8ball`, and a full IdleRPG with items, battles, alignment,
  and timed party quests. There's a read-only web dashboard, because of course there is.
- **Cross-network identity** — `!register` and `!link` mean one person is one identity
  whether they showed up on IRC or Discord. One hero, one karma score, one bot that
  remembers them.
- **Channel keeping** — eggdrop-style. An opped bot keeps its siblings opped and rejoins
  its channels when it gets kicked. The most recent release made the rejoin behaviour
  properly automatic, which is exactly the sort of unglamorous fix that makes a bot feel
  alive instead of fragile.
- **Lua plugins** — drop a `.lua` file in and you've added a `!command`. No rebuild, no
  redeploy. This is the eggdrop scripting experience, minus TCL.

Bots talk to each other over a shared Redis bus, which is how multi-bot skits work — one
sets up, another lands the punchline, and the channel watches two bots do a bit.

## Running it

It's GitOps-deployed to Kubernetes, because that's where the rest of my things live and one
more Deployment costs me nothing. But you shouldn't need a cluster to annoy your friends, so
there's a Docker Compose stack in the repo too.

Currently at v1.62.0 and open source. Fair warning: the Markov brain is only as good as what
you feed it, and it will absolutely repeat the dumbest thing you said last Tuesday back to
you at the worst possible moment. That's not a bug — that's the whole product.
