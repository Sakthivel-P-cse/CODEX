# Security

## Scope

Blueprint is a documentation and shell repository. It does not run a web
server, persist application data, or contain production credentials.

## Secure defaults

Generated applications must:

- keep secrets in environment variables or a secret manager; never commit them;
- validate and constrain all external input before use, use parameterized queries,
  and enforce authentication, authorization, and ownership server-side;
- use secure, HttpOnly, SameSite cookies, restrictive CORS, request limits,
  rate limits, security headers, safe production errors, and redacted logs;
- protect against injection, XSS, CSRF, SSRF, path traversal, mass assignment,
  unsafe uploads, and sensitive-data leakage;
- keep databases, caches, admin routes, metrics, and internal services private;
- use TLS, pinned dependencies and lock files, non-root containers, and least
  privilege.

Never disable a security check to make a generated application work. Review
threats and deployment configuration before production exposure.

## Reporting

Do not open a public issue for a suspected vulnerability. Report privately to
the repository maintainers with reproduction steps, impact, affected revision,
and a proposed mitigation. Do not include live credentials or personal data.

