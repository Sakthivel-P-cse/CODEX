# Blueprint repository policy

Blueprint is a small, principles-first process for AI coding. It separates thinking phases from the workflow that ships code.

## Repository map

- `skills/`: the five phase skills and two delivery workflow skills. Each directory contains one canonical `SKILL.md`.
- `examples/`: reviewed examples that demonstrate the design and planning outputs.
- `README.md`: the public overview, installation instructions, and workflow model.
- `MIGRATION.md`: breaking-change and upgrade guidance for previously installed Blueprint versions.
- `REVIEW.md`: the review standard for changes to Blueprint itself.
- `CLAUDE.md`: the Claude Code adapter; shared policy stays in this file.

## Working in this repository

- This is a documentation-and-shell repository with no package-manager install, build, or automated test suite.
- Read the affected skill, its callers, and the corresponding public documentation before changing workflow behavior.
- Keep skill frontmatter names aligned with directory names and keep descriptions specific enough to route requests correctly.
- When a skill changes, update `README.md`, `MIGRATION.md`, `CLAUDE.md`, or examples only where the public behavior or migration path also changed.
- Run `git diff --check` for every change.
- Run `bash -n .githooks/pre-push examples/regenerate.sh` when shell files change.
- When skill behavior affects golden examples, run `./examples/regenerate.sh`, follow the printed regeneration workflow, and review the resulting diff.

## Principles

- Give agents outcomes, constraints, and proof. Trust them with mechanics.
- Keep one skill per meaningful engineering phase or delivery outcome.
- Skip phases that add no value. Small, decided work can go straight to implementation.
- A task is ready when a new agent can finish it without asking product or technical questions.
- Tests prove the requested behavior. Review checks that the proof and implementation are sound.
- Browser behavior is proven in a real browser, not by reading source.
- If the task, design, or plan is wrong, update it before changing more code.
- Prefer the smallest complete change. Do not mix product work with unrelated cleanup.
- Humans review decisions and merge. Agents handle the path between them.

## Phases

- `/design`: decide what to build, why, and how. Stop for human review.
- `/plan`: split decided work into ordered, agent-ready tasks. Stop before implementation.
- `/test`: prove acceptance criteria and important failures, including browser checks when relevant.
- `/review`: use a fresh subagent for an independent, read-only review.
- `/improve`: inspect existing code and improve its clarity, simplicity, and structure without changing intended behavior.

## Workflow: Milestones

For a GitHub milestone, use `/milestone`. It orders open issues and runs `/task-to-pr` one issue at a time. Stop for human merge after each green pull request unless the user explicitly delegates merging for that run.

Writing code is a base capability, not a separate phase skill. Debugging and test-driven development are implementation techniques, not product-level entry points.

## Workflow: Code changes

For one end-to-end code change, follow the canonical [`/task-to-pr` skill](skills/task-to-pr/SKILL.md). It owns ticket handling, worktree isolation, coding, tests, independent review, commits, pull requests, CI, and current feedback. Never merge unless the user explicitly asks.

## Outputs

- Designs default to `docs/<feature-slug>/design.md`.
- Plans are returned in chat by default or published as tracker tickets when asked. They are not stored as plan documents.
- Pull requests state the outcome, link the ticket, and include test, browser, and review evidence as relevant.

Use `.github/pull_request_template.md` for pull requests. Record the checks actually run; if a relevant check is unavailable, write `Not run` and explain why.

Exploration does not require a design, plan, or ticket. Do not create process artifacts that do not improve a decision, handoff, or proof.
