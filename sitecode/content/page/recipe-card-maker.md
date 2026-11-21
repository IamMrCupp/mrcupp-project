---
title: recipe-card-maker
subtitle: Recipes in, printable binder pages and tin cards out
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/recipe-card-maker](https://github.com/IamMrCupp/recipe-card-maker)

### About
recipe-card-maker started as a recipe collection where plain markdown files were the whole
thing — one file per recipe, YAML frontmatter for the metadata, the body for the method. A
small Python toolchain reads each one and prints two things: a letter-size page for the
kitchen binder and a 4×6 card for the recipe tin, plus a categorized index with a tag cloud
so the collection stays browsable. reportlab does the layout, and the PDFs come out
byte-for-byte reproducible.

That part still works exactly the same. What's new is the app on top of it.

### The app
A FastAPI backend and a SvelteKit frontend for getting recipes in without hand-writing
markdown:

- **An editor** for new recipes, edits, and deletes. It's the spine of the app — every
  importer below produces a draft, and nothing is saved until the editor confirms it.
- **Import from a website.** Paste a URL; structured recipe data is read first, and an LLM
  only steps in when a site doesn't have it. Redirects are followed one hop at a time, with
  each address checked again so an import can't be pointed at something on the local network.
- **Import from a photo.** Take a picture of a cookbook page or a recipe card, and it's read
  into a draft, with the photo attached to the recipe.
- **Import from a social post.** Paste the caption and get a draft back.
- **Recipe images**, attached in the editor and exported as web-sized copies alongside the
  markdown.
- **Cards that fit.** Denser 4×6 typography, so a recipe takes fewer cards, and a 6×4
  landscape option.
- **Dark and light themes** that follow the system, with a toggle.

In the app, the database is the source of truth and markdown and PDF are export formats —
so the recipes still come out as plain files I own, and the binder pages and tin cards
still come from the same builders the command line uses.

### Running it
It's built to run at home: a single-user login gates it, and CI publishes an arm64 image
for a home server. Or skip the app entirely — `make` still turns a folder of
markdown into PDFs.
