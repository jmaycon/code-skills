---
name: capture-flow
description: Extracts system or feature requirements from conversational input and formats them into a structured Markdown document. Triggered when discussing or implementing business flows.
---

# Capture Flow (Sketch Pad)

## Trigger Conditions
Read or update `docs/sketch_pad.md` (or similar file in the `docs/` folder near project notes) when the user:
- Discusses or asks to implement something representing a business flow or feature.
- Introduces new requirements organically while implementing an existing feature.
- Talks about high-level concepts for the system.
- If the `using-superpowers` skill is activated, use it as an opportunity to capture and dump useful information here.

## Core Directives
- **Capture as we go**. The goal is not to enforce a rigid, upfront design phase, but to capture requirements as they naturally appear in conversation.
- **Maintain a single sketch document**. Use one unified file, e.g., `docs/sketch_pad.md`, located near the project notes. Update it whenever new relevant details arise.
- **Extract requirements**. Distill conversational input into structured Markdown, highlighting the system and feature requirements.
- **Stay out of the way**. Do this in parallel with implementing the feature, without interrupting the flow of development.
- **Apply `no-fluff`**. Write all entries using the `no-fluff` skill to ensure direct, concise communication without unnecessary filler.

## File Structure (`docs/sketch_pad.md`)
Treat the file as a single running log. Append new entries at the bottom with a date heading.

### `[YYYY-MM-DD]` Topic / Feature Name
- **Concepts & Flows**: Overview of domains and business logic.
- **Requirements**: Expected behaviors, system capabilities, and extracted constraints.
- **Scratch & Ideas**: Open questions, unstructured thoughts, or dumped information from the session.
