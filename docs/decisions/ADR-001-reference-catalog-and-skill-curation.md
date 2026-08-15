# ADR-001: Keep UI libraries as a routed reference catalog and curate global skills

## Status

Accepted

## Date

2026-08-15

## Context

The workspace contains multiple cloned agentic UI libraries and a third-party pack of general engineering skills. Loading every workflow globally would create duplicated and conflicting instructions, while leaving UI references unindexed makes them hard to select efficiently.

## Decision

Keep the UI repositories under `references/ui/agent-ui-libs/` as read-only source references. Route agentic UI work through `references/ui/README.md`, selecting the narrowest matching repository before using Bklit UI or Stitch.

Install only the three non-overlapping global workflows from the evaluated agent-skills pack:

- `documentation-and-adrs`
- `source-driven-development`
- `doubt-driven-development`

## Consequences

- UI work starts from existing, relevant patterns without making every library a project dependency.
- Bklit UI and Stitch remain fallbacks for features absent from the reference catalog.
- Global skill discovery stays compact and avoids enforcing the third-party pack's full lifecycle on every task.
- New reference collections should add a catalog entry and a purpose-specific selection guide when needed.

