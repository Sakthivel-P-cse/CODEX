# Reference Catalog

References are source material for inspection and pattern reuse. They are not dependencies of active projects and must not be modified unless the task explicitly targets that reference repository.

## Collections

| Collection | Use for | Entry point |
| --- | --- | --- |
| `ui/agent-ui-libs/` | Agentic UI, component, graph, dashboard, and visual-pattern references | [UI selection guide](ui/README.md) |
| `engineering-workflows/agent-skills/` | Evaluated third-party workflow checklists and skill source | Inspect only when a focused workflow gap is identified; do not enable the full pack by default. |

## Use policy

1. Identify the requested feature and target project's stack/design system.
2. Consult the smallest relevant reference repository, not the entire catalog.
3. Adapt the pattern; do not copy code or assets wholesale without checking licensing and compatibility.
4. Use external UI generation or a new component library only when this catalog lacks a suitable feature.
