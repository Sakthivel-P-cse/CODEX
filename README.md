# Codex Workspace

This directory is a working area for Codex configuration experiments, active checkouts, and reusable reference material.

## Layout

| Path | Purpose |
| --- | --- |
| `projects/` | Recommended home for future active project clones. |
| `references/` | Read-only inspiration and implementation references; see its [catalog](references/README.md). |
| `test/` | Sandboxed third-party repositories evaluated before adoption. |
| `blueprint/`, `dyad/` | Existing independent project checkouts; follow their own instructions. |
| `.env` | Local-only environment data. Never read or commit it unless explicitly required. |

## Working conventions

- Start work from the target project directory, not this workspace root.
- Keep reusable source material in `references/`; do not make product changes there.
- For agentic UI work, use the [UI reference selection guide](references/ui/README.md) before reaching for a new generator or component library.
- Global Codex behavior belongs in `~/.codex/AGENTS.md`; project instructions take precedence.

