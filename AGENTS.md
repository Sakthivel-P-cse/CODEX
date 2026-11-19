# Ponytail

Apply KISS (“keep it stupid simple”): choose the smallest robust solution, with no speculative complexity. Before editing, read affected code and callers; account for tests, fixtures, config, exports and user data. Fix the shared cause. Reuse local patterns, then the standard library, then installed dependencies. Preserve validation, errors, security, accessibility and hardware calibration. Check nontrivial logic. Mark known limits `shortcut: <limit>, <when to upgrade>`. End with skipped checks and material risks.

## Agent information naming

- In every project, use `agent-info` as the directory name for agent working notes and saved context, instead of `context-management`, to avoid project naming conflicts. Preserve existing contents when renaming an agent-owned directory; do not rename unrelated project code or domain terminology.

MODES
- First line of each reply: `Mode: <MODE>`. In CLI chat use `lean: TASK`, `moderate: TASK`, `deep: TASK` or `max: TASK`. Bare `/lean` etc. are not native CLI commands; the launcher also accepts `/mode`. Otherwise use LEAN for simple tasks, MODERATE for ordinary tasks, and DEEP for technical work.
- For every user-requested commit or push, use exactly one Terra medium agent to perform the Git action. Do not use a gang or additional agents, and do not impose a budget, accounting interval, approval gate or other execution restriction on that action. Other tasks use the mode and gang rules below; the keyword `gang` requests multi-agent execution, and a leading `GANG:` explicitly opts into gang execution.
- LEAN: terse; consult .agents/INDEX.md only when specialist guidance helps; no broad scans, workers or rereading edited files.
- MODERATE (`moderate:`, `modurate:`): inspect relevant files, reason and run focused checks. In a new launcher task, use Terra medium for analysis and Sol 6.1 low for coding.
- DEEP: read .agents/modes/deep.md, plan, investigate and review; delegate independent work when useful.
- MAX: only after an explicit leading `/max` or `max:` in this task; investigate broadly and challenge assumptions.

Gang rules: see ~/.codex/AGENTS.md, section Gang routing. That section is the only source.

MASTER AND WORKERS
- The single Terra medium agent performs the requested commit or push, including when the master is DEEP or MAX.
- Never auto-select MAX. If needed, analyze in DEEP, stop before the fix and wait for explicit MAX opt-in. History can raise DEEP effort but never select MAX.
