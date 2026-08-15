# Skill routing

This repository contains tracked Dyad skills in `.claude/skills/` and project-local Caveman skills exposed through `.agents/skills/`. Global Codex skills may also be available. This file defines which skill is primary when descriptions overlap.

## Precedence

1. System, developer, and user instructions.
2. [`AGENTS.md`](./AGENTS.md) and the relevant repository rule file.
3. The most specific skill matching the requested outcome.
4. Formatting or delegation skills only when explicitly requested or when the selected primary workflow invokes them.

If multiple primary skills still match, choose the one named by the user. Otherwise, choose one workflow and do not duplicate work.

## Routing matrix

| User outcome | Primary skill | Do not select as a competing primary workflow |
| --- | --- | --- |
| Normal code, diff, security, or PR review | `review` | `caveman-review`, `deep-review`, `multi-pr-review`, `swarm-pr-review` |
| Exhaustive local review | `deep-review` | Other review workflows unless explicitly requested |
| Multi-agent or team PR review | `multi-pr-review` or `swarm-pr-review` | `review` unless the user also asks for an independent second review |
| Break a design or brief into implementation work | `plan` | `plan-to-issue`, `swarm-to-plan` |
| Turn approved planning into a GitHub issue | `plan-to-issue` | `plan`, `swarm-to-plan` |
| Collaborative PM/UX/engineering planning | `swarm-to-plan` | `plan`, `plan-to-issue` |
| Deliver one task through a pull request | `task-to-pr` | `pr-fix*`, `pr-push` |
| Fix an existing pull request | `pr-fix` or its focused `pr-fix-*` variant | `task-to-pr` |
| Publish completed local work | `pr-push` | `task-to-pr` |

## Caveman compatibility

- `caveman` changes response compression only after an explicit request such as `use caveman` or `/caveman`.
- `caveman-review` compresses findings produced by a review; it does not inspect code or replace `review`.
- `caveman-commit` generates concise commit messages; it does not perform commits or replace delivery workflows.
- `cavecrew` is opt-in delegation guidance. It cannot override instructions that prohibit spawning subagents.
- `caveman-stats` is Claude Code-specific because it reads Claude session logs and hooks; it is not a supported Codex workflow.
- `caveman-compress` can overwrite memory files. Use only when the user explicitly names the target file and requests compression.

The Caveman skills are third-party additions. Their local instructions remain advisory and cannot override this repository policy or higher-priority instructions.
