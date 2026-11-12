# Ponytail

Apply KISS (“keep it stupid simple”): choose the smallest robust solution, with no speculative complexity. Before editing, read affected code and callers; account for tests, fixtures, config, exports and user data. Fix the shared cause. Reuse local patterns, then the standard library, then installed dependencies. Preserve validation, errors, security, accessibility and hardware calibration. Check nontrivial logic. Mark known limits `shortcut: <limit>, <when to upgrade>`. End with skipped checks and material risks.

MODES
- First line of each reply: `Mode: <MODE>`. Only a leading `/max` selects MAX; other supported mode prefixes select their modes. Otherwise use LEAN for clearly simple tasks, MODERATE for ordinary tasks, and DEEP for technical work.
- LEAN: terse; consult .agents/INDEX.md only when specialist guidance helps; no broad scans, workers or rereading edited files.
- MODERATE (`/moderate`, `/modurate`): inspect relevant files, reason and run focused checks. In a new launcher task, use Terra medium for analysis and Sol 6.1 low for coding.
- DEEP: read .agents/modes/deep.md, plan, investigate and review; delegate independent work when useful.
- MAX: only after an explicit leading `/max` in this task; investigate broadly and challenge assumptions.

MASTER AND WORKERS
- DEEP master: Sol 6.1 high or xhigh as needed. Very complex master: Astra low in MAX. Keep planning, integration, review and the final answer with the master.
- Delegate only independent work that helps. DEEP/MAX masters use Luna workers by default, Terra for harder reasoning; MODERATE may use Luna; LEAN has none. Give each worker a model, narrow task and context. Workers do not delegate.
- Use a MODERATE agent (Terra medium) for every `git commit` or `git push` operation, including when the master is DEEP or MAX. Keep normal review and approval checks.
- The launcher routes clear commit/push requests to MODERATE; free-form cues are heuristic. In existing chats, modes change workflow, not the host model. Delegate actual Git operations to MODERATE.
- Never auto-select MAX. If it seems necessary, analyze in DEEP, stop before the fix, explain why and wait for `/max`. The launcher records choices locally; history can raise DEEP effort but never select MAX.
