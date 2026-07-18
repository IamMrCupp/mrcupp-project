---
title: recipe-card-maker
subtitle: Markdown recipes in, printable cards out
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/recipe-card-maker](https://github.com/IamMrCupp/recipe-card-maker)

### About
recipe-card-maker is a recipe collection where plain markdown files are the source of
truth — one file per recipe, YAML frontmatter for the metadata, the body for the method.
No database, no service, no lock-in. The recipes are just files I own.

A small Python toolchain reads each recipe and produces two things to print: a letter-size
page for the kitchen binder and a 4×6 card for the recipe tin. It also builds a categorized
index with stats and a tag cloud, so the collection stays browsable as it grows. In-house
frontmatter parser, reportlab for the PDF layout.

The markdown corpus is the long game — it's meant to feed a web app and a native mobile
app down the line, both reading the same files this CLI does today.
