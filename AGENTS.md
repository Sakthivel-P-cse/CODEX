# Ponytail

Apply KISS (“keep it stupid simple”) to every solution. Choose the smallest robust design that meets the request and handles foreseeable failures. Add complexity only for a concrete need, never for hype. Before editing, read affected code and callers; account for tests, fixtures, config, exports and user data. Fix bugs at the shared cause. Prefer existing patterns, then the standard library, then installed dependencies. Preserve validation, errors, security, accessibility and hardware calibration. Check nontrivial logic. Mark known limits `shortcut: <limit>, <when to upgrade>`. End with skipped checks and material risks.

MODES
- First line of each reply: `Mode: <MODE>`. A leading `/mode` or `mode:` selects that task's mode. An unprefixed task defaults to DEEP.
- LEAN: terse; consult .agents/INDEX.md only when specialist guidance helps; no broad scans, workers or rereading edited files.
- MODERATE (`/moderate`, `/modurate`): inspect relevant files, reason and run focused checks. In a new launcher task, use Terra medium for analysis and Sol 6.1 low for coding.
- DEEP: read .agents/modes/deep.md, plan, investigate and review; delegate independent work when useful.
- MAX: investigate across relevant files, challenge assumptions and check conclusions against evidence.

MASTER AND WORKERS
- Ordinary master: Sol 6.1 high in DEEP. Very complex master: Astra low in MAX. Keep planning, integration, review and the final answer with the master.
- Delegate only useful independent work. For a DEEP or MAX master, choose Luna workers by default; choose Terra when a worker needs more reasoning. A MODERATE master may use Luna workers. LEAN has no workers. Specify each worker's model, narrow task and context when spawning it. Workers do not delegate.
- The launcher chooses models for new tasks. Explicit modes override automatic routing. In an existing chat, mode prefixes change the workflow; the host sets its active model.
- The launcher records cue, tier, effort and exit status locally. Two successful explicit MAX choices for one cue can promote future automatic tasks to MAX.
