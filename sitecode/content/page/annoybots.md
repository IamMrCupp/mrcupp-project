---
title: annoybots
subtitle: The eggdrop and BMotion era, rebuilt as one Go binary
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/annoybots](https://github.com/IamMrCupp/annoybots)

### About
If you were on IRC in the early 2000s you remember the bots — eggdrop keeping the channel
opped, BMotion babbling nonsense it learned from the last hour of chat. Both still exist.
Both are also a TCL stack nobody wants to maintain in the 2020s.

annoybots is that whole idea rewritten in Go: one small binary holding many chat
connections at once — IRC networks, Twitch, and Discord — with every channel routed through
a shared annoyance engine.

The design decision that matters: **personality is config, not code.** A new bot is a new
YAML file and a new pod, never a fork. The repo ships two examples, Echo and Mimic, to copy
from.

What it does:

- **Triggers and interjections** — keyword and regex triggers with randomized templated
  responses, plus unprompted ambient lines on a per-channel cooldown.
- **A learning brain** — an order-N Markov chain that learns from channel chatter and
  babbles it back, mangled. It persists to disk, so learning survives a restart. This is
  the BMotion babble everyone remembers, minus the abandoned TCL.
- **Multi-network in one process** — IRC and Twitch share a wire protocol, so Twitch just
  needs CAP negotiation, an `oauth:` token, and tighter rate limits. Discord rides the same
  engine alongside them.
- **Cross-network identity** — `!register` and `!link` mean one person is one identity
  whether they showed up on IRC or Discord.
- **Games** — karma, `!roll`, `!8ball`, and a full IdleRPG with items, battles, alignment,
  timed party quests, and a read-only web dashboard.
- **Channel keeping** — eggdrop-style. An opped bot keeps its sibling bots opped and
  rejoins its channels if it gets kicked.
- **Lua plugins** — drop a `.lua` file to add a `!command`, no rebuild.
- **A chat admin console** — DM the bot to puppet it, edit quotes, manage channels and
  admins. Identity-authenticated and tiered by access flag.

Bots coordinate through a shared Redis bus, which is also how multi-bot skits work — one
bot sets up, another lands the punchline. The whole thing is GitOps-deployed to Kubernetes,
or there's a Docker Compose stack if you'd rather not run a cluster to annoy your friends.
