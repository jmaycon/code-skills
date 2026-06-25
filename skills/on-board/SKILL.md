---
name: onboard
description: Read and maintain project notes. Summarize project goals, structure, patterns, and past mistakes. Triggered on start, error, or frustration.
---

# Onboard

## Trigger Conditions
Read or update `docs/project_notes.md` when user says:
- "remember"
- "we learn"
- "error"
- "frustration"
- "update notes"

## Core Directives
- **"It is not about being long, it is about being useful."**
- **Read on start**. Understand project context, folders, and patterns before acting.
- **Update on failure**. Document mistakes, errors, and corrected approaches. Learn from frustration.
- **Update on repetition**. If user repeats instructions, add to patterns with high weight.
- **No fluff**. Direct language. No jokes. Be an efficient agent companion tailored to custom needs.
- **No specific agent names**. Refer to generic "agents" or "AI companion". Do not use names like Claude or Gemini.
- **Single file**. Use only `docs/project_notes.md`. Do not create separate bug or decision logs.

## File Structure (`docs/project_notes.md`)
Maintain these sections in the notes file:

### 1. Project Overview
- 1-2 sentences. What is being built.

### 2. Folder Structure
- Main directories and purposes.

### 3. High-Weight Patterns
- Repeated user instructions.
- Custom architectural patterns.

### 4. Mistakes & Lessons
- Previous errors.
- Failed approaches.
- Frustrations and the learned solutions.