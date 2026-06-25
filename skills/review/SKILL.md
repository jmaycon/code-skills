---
name: review
description: Validate code changes manually. Review, test, lint, docs, commit, push, PR. Use when user asks to validate changes, or push safely.
user-invocable: true
---

## Philosophy

Validate before shipping. No unverified claims. Use ONLY vanilla `git` commands. No external CLI tools.

## Invocation Modes

* **Validate-only**: Bare `/review`. Validate existing commits. Report outcome.
* **Task-first**: `/review <task>`. Execute task -> commit to feature branch -> validate.

## Execution Flow

### 1. Scope & Branch
* Check `git status`.
* Preserve unrelated changes.
* Isolate task. Create `feature/branch`.
* Commit changes.

### 2. Capture Intent
* Define user intent. What did they want?
* Capture tradeoffs, constraints, product decisions.
* Use intent during review to distinguish deliberate choices from bugs.

### 3. Validate
* **Review**: Read diffs. Match against intent. Spot bugs, edge cases.
* **Test**: Execute local test suite. Pass -> continue. Fail -> fix -> retry.
* **Lint**: Execute local static analysis. Fix errs.
* **Docs**: Update inline docs, ADRs, READMEs.

### 4. Decide & Fix
* Classify findings during validation:
  * **Auto-fix**: Mechanical, low-risk -> fix immediately.
  * **No-op**: Informational -> ignore.
  * **Ask-user**: Challenges intent or alters product behavior -> escalate to user.
* NEVER assume product decisions. Relay `ask-user` findings verbatim. Ask how to proceed.
* Commit all validation fixes to the same branch.

### 5. Ship & Report
* Write conventional commit (e.g., `feat:`, `fix:`).
* Push branch. 
* Await CI pipeline green (if applicable).
* Report final outcome. Summarize validation fixes explicitly.
