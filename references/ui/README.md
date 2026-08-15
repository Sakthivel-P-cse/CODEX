# Agentic UI Reference Selection Guide

Use this catalog for agentic or AI-product UI work. Choose the narrowest repository that already covers the requested feature, then adapt it to the target project's stack, tokens, accessibility requirements, and license.

| Need | Start with | Why |
| --- | --- | --- |
| Chat, assistant surfaces, tool calls, streaming messages | `assistant-ui`, then `ai-elements` | Mature assistant interaction patterns and AI-oriented React primitives. |
| Copilot panel, shared agent state, human-in-the-loop collaboration | `CopilotKit` | Co-agent and in-app copilot interaction patterns. |
| Agent/event protocol UI or runtime-agnostic agent state | `ag-ui` | Protocol and agent-user-interface abstractions. |
| Multi-agent workflow, planner, or enterprise operations UI | `magentic-ui` | Microsoft agent-workflow UI patterns. |
| Traces, prompt operations, evaluations, or LLM observability UI | `langfuse` | Production observability and evaluation interfaces. |
| Node editor, workflow canvas, dependency graph, or edge routing | `xyflow` | Purpose-built interactive graph and flow primitives. |
| Data-heavy dashboard, KPI cards, tables, and common charts | `tremor` | Dashboard-oriented React components and data patterns. |
| General polished primitives, motion, and page sections | `magicui`, `cult-ui`, `originui`, or `react-bits` | Choose the one whose existing primitive best matches the desired interaction. |

## Selection order

1. Search the listed repository most closely aligned with the feature.
2. If it has a suitable template or component, adapt that pattern to the target project.
3. If no reference repository covers it:
   - Use Bklit UI for a React chart or visualization.
   - Use Stitch for a genuinely new UI direction or screen scaffold.
4. Preserve the target project's existing design system. A project-selected UI or chart library overrides this guide.

## Boundaries

- These repositories are references, not automatic runtime dependencies.
- Inspect only the files relevant to the feature; avoid broad scans.
- Check license and package compatibility before copying source or installing a dependency.
- Do not modify these clones during product work.

