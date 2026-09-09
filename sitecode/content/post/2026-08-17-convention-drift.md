---
title: "The Lint That Catches Me Contradicting Myself"
subtitle: "claude-project-kit 1.6.0, and why a session log with a hole in it is worse than no log"
date: 2026-08-17T23:30:00-07:00
tags: [ "claude-project-kit", "ai", "workflow", "projects" ]
---

# The kit I never announced

Every post on this site since May has been written, in part, with
[claude-project-kit](/page/claude-project-kit/) in the loop. It's the scaffold I use to
keep AI-assisted work grounded across a pile of repos: a private working folder next to
each project with a context file and a session log, per-project memory for how I like to
work, and lifecycle slash commands that load all of it before anything gets touched. I've
linked it, listed it, and never actually written about it. 1.6.0 is a decent excuse.

## Two sources of truth is one too many

The kit keeps the rules in two places on purpose. The working folder's context file says
how *this project* works — branch base, merge strategy, commit shape, what the tracker is.
Auto-memory says how *I* work, across every project. Most of the time they agree.

When they don't, the assistant doesn't notice. It reads both, picks one, and proceeds with
total confidence. I found this the way you find everything: a repo whose default branch is
`master`, a memory file that says `main`, and a CI fix titled "push changelog to master not
main" that should never have been necessary.

So 1.6.0 adds a **convention-drift check**. It reads the context file and the memory
files, compares the claims they both make, and reports the disagreements. It runs as a
step in `/session-verify`, and there's an optional git hook if you'd rather be told before
the commit than after. It's a small script. It's caught three real conflicts in the first
week.

## Log on merge, not on "end"

The other change is subtler. The session log used to be written at the end of a session.
Sessions don't end cleanly — the context window fills, the laptop lid closes, the
conversation just stops. One project of mine had a **ten-day hole** in its log where the
context file and the checklist stayed current (a later session rebuilt them by reading
`main`) but everything that only lived in conversation was gone. Nothing detected it. A
missing entry is invisible until someone goes looking.

The trigger is now the **PR merge**. A merge is a real event with a real timestamp, it
happens in the middle of a session rather than at a hypothetical end, and if the log entry
isn't there the next session can see the gap between the last entry and the last merge.
Log what shipped, when it shipped.

## What it isn't

It's not a plugin, it doesn't replace `CLAUDE.md`, and it isn't a tracker. It's templates,
a bootstrap script, eleven commands, three starter agents, and now a lint — with a Bats
suite and CI behind it because a workflow tool that isn't tested is a superstition.
MIT-licensed. [Take it](https://github.com/IamMrCupp/claude-project-kit), strip out what
doesn't fit how you work, keep the rest.
