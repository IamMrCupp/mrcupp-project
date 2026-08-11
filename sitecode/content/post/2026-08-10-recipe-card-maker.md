---
title: "Recipes That Outlive the App"
subtitle: "Markdown in, binder pages and tin cards out"
date: 2026-08-10T19:00:00-07:00
tags: [ "recipe-card-maker", "python", "self-hosted", "projects" ]
---

# Every recipe app is a hostage situation

You put your recipes in an app. The app is nice. Then it gets acquired, or adds a
subscription, or the export button gives you a JSON blob with the ingredients as one
unparseable string. Meanwhile the recipes themselves — the actual thing you cared about,
some of them from people who aren't around to ask again — are inside somebody's product
decisions.

[recipe-card-maker](/page/recipe-card-maker/) is the boring fix. **The recipes are markdown
files. That's the whole storage layer.** One file per recipe, YAML frontmatter for metadata,
the body for the method. No database, no service, no account.

If every tool I wrote for it vanished tomorrow, I'd still have a folder of readable text
files, and so would anyone I gave a copy to.

## Two things to print

Files are the source of truth, but you don't cook off a text editor. A small Python
toolchain turns each recipe into two artifacts:

- **A letter-size page** for the kitchen binder — the one that goes on the counter and gets
  flour on it.
- **A 4×6 card** for the recipe tin, because some recipes want to live in the tin.

Same source, two layouts. Change the recipe once and rebuild.

It also regenerates the collection index — categories, counts, cuisine, difficulty, active
time, a tag cloud — straight from the frontmatter. The README you land on in the repo isn't
hand-maintained; it's built. An index that's generated stays true, and an index you update
by hand stays true for about three weeks.

In-house frontmatter parser, reportlab for the PDF layout. Rebuild everything with `make`, or
one recipe at a time while you're iterating on it.

## Honest status

The toolchain works. **The collection is two recipes.**

Sun and Moon cookies and an Erdbeertorte, both German, both from the konditorei end of
things. That's not a soft launch, that's just where it is — I built the machine before I fed
it, which is a very software-person way to approach a recipe box and I'm at peace with it.

The corpus is the long game. Markdown recipes with structured frontmatter are a decent
substrate for other things later — a web app, a phone app on the couch, a shopping list
generator that actually understands quantities. None of that exists. But none of it needs the
storage format to change, which was the point of picking plain files in the first place.

Right now it prints a very nice Erdbeertorte card. Start somewhere.
