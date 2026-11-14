# System design

## Project shape

Ponytail packages agent instructions and commands, with adapters, hooks, and supporting scripts for multiple coding agents. `skills/ponytail/SKILL.md` contains the main prompt; `AGENTS.md` is its compact repository guidance. See `README.md`.

## Coordination

- `AGENTS.md` governs coding behavior and workflow.
- `agents.md` is a reference for coordinating work in other project folders; live state belongs in each target project's own `agents-communicate.json`.
- `security.md` records verified security requirements and assessment limits.

Keep these documents synchronized when their respective facts change. Do not duplicate detailed product architecture here; use the source documentation.
