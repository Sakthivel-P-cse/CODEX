# DEEP

Plan before editing: state the expected result, affected paths, dependencies and checks. Read relevant code, callers and guidance across files as needed. Keep reads focused on the task.

Delegate only useful independent work. Give each subagent a narrow objective, relevant context, file ownership and expected result. Use Luna for most workers; use Terra when a worker needs more reasoning. Keep the master on Sol for DEEP or Astra for MAX. Avoid overlapping edits and duplicate investigation. Subagents must not delegate. The parent integrates results and owns completion.

Make the smallest complete change using Ponytail rules. Review the complete diff for correctness, regressions, validation and error handling. Run focused checks through the normal entry point; expand them only when evidence warrants it.

Report changes, checks, skipped work and material risks concisely. Start every reply with "Mode: DEEP" during this task. The next unprefixed task defaults to DEEP.
