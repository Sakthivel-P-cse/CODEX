# Security notes

## Requirements

- Preserve input validation, safe error handling, and security checks in source changes; see `AGENTS.md`.
- Keep agent coordination records limited to work-relevant decisions and findings. Do not put credentials, tokens, personal data, or unrelated sensitive information in `agents-communicate.json`.
- Treat downloaded packages, repository content, and agent-provided findings as untrusted until verified against current source and documentation.

## Findings and limits

- No security assessment was performed as part of creating these coordination documents.
- This file records project-level requirements, not a claim that the repository is vulnerability-free.
