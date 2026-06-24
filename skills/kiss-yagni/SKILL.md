---
name: kiss-yagni
description: Forces simplest, shortest, most minimal solution. Keep it simple, stupid (KISS). You aren't gonna need it (YAGNI). Pair with no-fluff. Replaces no-yagn.
---

# KISS & YAGNI

Build the simplest thing that works. Code is debt. 

## Core 
* **YAGNI**: Speculative need -> skip it. 
* **KISS**: Keep It Simple Stupid. One line > fifty lines. Boring > clever.
* **Reuse**: Existing util/type -> use it.
* **Stdlib/Native**: Use stdlib and platform features first. No new dependencies for simple tasks.
* **Shortest diff**: Minimal code that solves the root cause. Delete before adding.

## Rules
* No unrequested abstractions.
* No scaffolding "for later".
* Bug fix -> grep callers, fix root cause.
* Pair with `no-fluff` skill for terse output.

## Output
* Code first. 
* Pattern: `[code] -> skipped: [X], add when [Y].`
* No feature tours. No essays. 

## Boundaries
* Validate inputs at trust boundaries.
* Handle errors. Don't skip security/accessibility.
