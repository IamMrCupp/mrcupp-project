---
title: claude-project-kit
subtitle: Start every AI-assisted session already grounded
comments: false
---

### Links
- GitHub: [github.com/IamMrCupp/claude-project-kit](https://github.com/IamMrCupp/claude-project-kit)
- Latest: [releases](https://github.com/IamMrCupp/claude-project-kit/releases)

### About
claude-project-kit is a reusable scaffold for working on real projects with Claude Code.
The problem it solves is boring but real: every fresh session starts by re-deriving what
the project is, what's been decided, and where things stand. The kit front-loads that work
once so it doesn't get paid again every session.

What it ships:

- **A bootstrap script** — one interactive run seeds a private working folder next to your
  repo (context file, session log, plan, per-phase checklists) and per-project auto-memory.
  Idempotent, dry-runnable, and it never modifies the target repo beyond a managed
  `.gitignore` block.
- **Lifecycle slash commands** — `/session-start`, `/session-end`, `/session-handoff`,
  `/close-phase`, `/pull-ticket`, `/run-acceptance`, and the rest. Eleven of them, installed
  once globally.
- **A convention-drift lint** — the newest piece. Working-folder context and auto-memory
  can disagree about the rules (branch base, merge strategy, commit shape), and when they
  do, the assistant picks one at random. The check catches the drift and runs as part of
  `/session-verify`, or as an optional git hook.
- **Starter agents and conventions** — a code reviewer, a session summarizer, a
  parallel-fan-out research agent; Conventional Commits, merge-only PRs, issue-first
  branches, test-first where the code shape fits.
- **Workspace mode** for multi-repo initiatives, with tracker awareness for GitHub, JIRA,
  Linear, and friends.

It's not a plugin and it doesn't replace `CLAUDE.md` — it sits alongside both. Backed by a
Bats test suite, CI, and ADRs for the decisions that weren't obvious. I use it daily,
on personal projects and at work. MIT — take it, strip out what doesn't fit how you work,
keep the rest.
