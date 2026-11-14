# Agent coordination

`AGENTS.md` is the source of coding and workflow instructions. This file defines coordination for agents working in other project folders; it is a reference and does not keep live task state here.

- The coordinating agent owns scope, integration, and the final report. Other agents own only the task assigned to them.
- In the target project folder, create and maintain its own `agents-communicate.json` at the project root. Never put this live state file in `/home/sakthi/codex`.
- Before starting, read the target project's `agents-communicate.json`; reread it before any dependent step or write.
- Keep one record per agent in that file, using these keys: `agent`, `task`, `status`, `findings`, `blockers`, `dependencies`, `next_action`, `updated_at`.
- Before writing, reread the file and preserve other agents' entries. Do not append duplicate entries or replace the whole file with only your own record.
- Record only decisions, verified discoveries, blockers, dependencies, and next actions. Remove obsolete entries when their work is no longer active or useful.
- Verify current source, configuration, and documentation before relying on a recorded finding; current evidence supersedes stale state.
- Keep `security.md` and `system-design.md` concise and update them only when verified requirements, risks, or architecture change.
