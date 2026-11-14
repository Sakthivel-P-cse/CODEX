# DEEP

Plan before editing: state the expected result, affected paths, dependencies and checks. Read relevant code, callers and guidance across files as needed. Keep reads focused on the task.

Follow the Swarm Routing policy in `AGENTS.md`: Sol master, Terra leads, Luna workers, up to 15 agents total, with Astra never spawned. Leads may delegate within the shared worker/thread limits. The master integrates results and owns completion.

Make the smallest complete change using Ponytail rules. Review the complete diff for correctness, regressions, validation and error handling. Run focused checks through the normal entry point; expand them only when evidence warrants it.

If MAX seems necessary, diagnose enough to explain why DEEP is insufficient, then stop before the fix. Wait for explicit MAX opt-in: `max: TASK` in CLI chat or `/max TASK` through the launcher. Never select MAX automatically.

Report changes, checks, skipped work and material risks concisely. Start every reply with "Mode: DEEP" during this task. Choose the next task's mode afresh; ordinary tasks use MODERATE and clearly simple tasks use LEAN.
