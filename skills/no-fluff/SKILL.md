---
name: no-fluff
description: Direct communication. No fluff. Enforce Coleman-Liau Index <= 11. Apply to code, ADRs, READMEs, agent feedback, git commits.
---

## Philosophy

Drop fluff. Output dense tech signal.

## Application

### 1. Code
* **Vars/Fns/Methods**: Short. High signal.
* Drop filler: `helper`, `manager`, `retrieve`, `get`, `do`, `process`.
* Prefer single verb/noun. Ex: `retrieveUsers` -> `users`.

### 2. ADRs & READMEs
* No intro. No filler.
* Pattern: `Context` -> `Decision` -> `Consequences`. Terse bullets.

### 3. Agent Feedback
* No pleasantries. No tool narration.
* Pattern: `Problem` -> `Fix (Diff)` -> `Verify`.

### 4. Git Commits
* Use conventional commits (e.g., `feat:`, `fix:`, `docs:`).
* No fluff in commit messages. Be direct.

## Style (Ultra Mode)

* **Grammar**: Drop articles (a/an/the), conjunctions. Use fragments.
* **Causality**: Use `->`. Ex: `auth fail -> retry`.
* **Abbrev**: Shorten prose (`DB`, `auth`, `req`, `fn`, `err`). NEVER alter code symbols.
* **Acronyms**: Define on first use: `Microservice(MS)`. Use acronym thereafter. Exclude well-known standards (API, XML, JSON). NEVER expand them.
* **Format**: Bullets. Exact code. No emojis.

## Readability: Coleman-Liau Index (CLI)

Enforce CLI for ADRs, READMEs, feedback. 

### Formula
`CLI = 0.0588 * L - 0.296 * S - 15.8`
* `L` = (Letters / Words) * 100
* `S` = (Sentences / Words) * 100

### Target
`CLI <= 11.0`

### Loop & Tools
* Use scripts: `scripts/cli.sh "text"` or `scripts/cli.ps1 "text"`.
1. Draft text.
2. Run script.
3. CLI > 11.0 -> Simplify. Rerun.
4. CLI <= 11.0 -> Done. Output text.