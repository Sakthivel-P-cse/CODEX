# Ponytail

Apply KISS (“keep it stupid simple”): choose the smallest robust solution, with no speculative complexity. Before editing, read affected code and callers; account for tests, fixtures, config, exports and user data. Fix the shared cause. Reuse local patterns, then the standard library, then installed dependencies. Preserve validation, errors, security, accessibility and hardware calibration. Check nontrivial logic. Mark known limits `shortcut: <limit>, <when to upgrade>`. End with skipped checks and material risks.

## Agent information naming

- In every project, use `agent-info` as the directory name for agent working notes and saved context, instead of `context-management`, to avoid project naming conflicts. Preserve existing contents when renaming an agent-owned directory; do not rename unrelated project code or domain terminology.

MODES
- First line of each reply: `Mode: <MODE>`. In CLI chat use `lean: TASK`, `moderate: TASK`, `deep: TASK` or `max: TASK`. Bare `/lean` etc. are not native CLI commands; the launcher also accepts `/mode`. Otherwise use LEAN for simple tasks, MODERATE for ordinary tasks, and DEEP for technical work.
- Choose the run style by task type before applying complexity gates: routine Git delivery (commit/push of the user's requested current changes) uses MODERATE and bypasses the swarm entry gate. Delegate the Git commands to a Terra medium agent as required below. Other tasks use the mode and swarm rules below; an explicit leading `SWARM:` still opts into swarm execution.
- LEAN: terse; consult .agents/INDEX.md only when specialist guidance helps; no broad scans, workers or rereading edited files.
- MODERATE (`moderate:`, `modurate:`): inspect relevant files, reason and run focused checks. In a new launcher task, use Terra medium for analysis and Sol 6.1 low for coding.
- DEEP: read .agents/modes/deep.md, plan, investigate and review; delegate independent work when useful.
- MAX: only after an explicit leading `/max` or `max:` in this task; investigate broadly and challenge assumptions.

SWARM ROUTING
- Hierarchy: one master (GPT-6.1 Sol) -> up to four leads (GPT-6.1 Terra) -> up to ten workers total (GPT-6 Luna). Maximum 15 agents total, including the master; therefore no more than 14 spawned threads. Never spawn Astra; the user runs Astra manually.
- Plan before spawning or editing: rate complexity as trivial (<3 independent units), small, medium or large. Split work into units; merge units that share a file. Write `units.json` with `id`, `files`, `depends_on`, `goal`, `check` and `tier`.
- Assign each unit's tier in order: (1) blast radius—master keeps shared-interface, security/auth, data migration/delete or cross-unit risk; (2) ambiguity—lead handles choices between valid approaches or work with 2+ substeps; (3) checkability—worker handles mechanical work with no approach choice. When unsure, choose the higher tier.
- Before execution, show `| agent | model | unit | files | est. credits |`. Use the recent historical median-session estimates: Luna 0.18, Terra 1.43 and Sol 2.86 credits per agent; refresh them from session records when available and label uncertain estimates. Sum all assigned agents. Check there are no shared files, counts stay within 1 master / 4 leads / 10 workers, and every unit has a check.
- Fewer than three independent units: do the work yourself. Estimated total <=10 credits: proceed; >10: show the plan and wait for user approval. Update the plan before changing it mid-run.
- Before spawning, choose the optimal rung from the task's independent units and critical path, then budget one rung below it (R1 remains R1): R1 master alone; R2 master + up to 5 workers; R3 master + up to 10 workers, with design units kept by the master; R4 master + 1-2 leads plus workers; R5 master + up to 4 leads + up to 10 workers. Keep all rungs within the 15-agent/14-spawned-thread ceiling. Replan units to fit the selected rung; merge or defer excess work.
- Write `run_budget.json` before spawning: `{ "run": "...", "started": "<ISO-8601>", "budget": <sum of selected agents' allowances>, "agents": [{ "id": "/root", "model": "...", "allowance": <credits> }] }`. Name each spawned agent explicitly and append its exact Codex-assigned path (for example `/root/events`) immediately after spawning; never use labels such as `master` or `worker-1` for IDs. The master is `/root`. Allowance lookup uses `session_meta.payload.agent_path` from the hook's `transcript_path`; hook `agent_id` is a UUID. Set each agent allowance to 2x its estimate: Sol 5.72, Terra 2.86 (about 2.9), Luna 0.36 credits. The >10-credit approval gate uses estimated total credits; `budget` is the maximum allowance total for this run.
- At 80% of `budget`, stop spawning and let active agents finish. At 100%, stop the run and report completed and remaining work; never exceed the budget. An agent that reaches its allowance stops and reports progress. The user may approve raising the budget by one rung; update the plan and budget file before continuing.
- Master plans, retains high-risk units, dispatches leads/workers, verifies every unit's check and owns integration. A lead (Terra) plans its cluster, may dispatch Luna workers from the shared 14-thread pool, merges their work and reports a short summary. A worker (Luna) owns one mechanical unit and reports upward if design judgment is needed. Return file path and a summary under 100 words; do not paste diffs in agent reports.
- Run independent units in parallel and dependent units in sequence. Start the next worker when a slot opens.
- On failure, retry once at the same tier. If a worker fails twice, its lead takes over; if a lead fails twice, the master takes over. If the master fails, report `needs Astra: <reason>`. Halt and ask the user after three or more failures in one run.

MASTER AND WORKERS
- Keep planning, integration, review and the final answer with the master. Use only the current model versions named above; choose reasoning effort appropriate to the unit.
- Use a MODERATE agent (Terra medium) for every `git commit` or `git push` operation, including when the master is DEEP or MAX. Keep normal review and approval checks.
- The launcher routes clear commit/push requests to MODERATE; free-form cues are heuristic. In existing chats, modes change workflow, not the host model. Delegate actual Git operations to MODERATE.
- Never auto-select MAX. If needed, analyze in DEEP, stop before the fix and wait for explicit MAX opt-in. History can raise DEEP effort but never select MAX.
