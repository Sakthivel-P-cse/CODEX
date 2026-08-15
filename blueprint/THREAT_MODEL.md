# Threat model

Blueprint protects source-controlled workflow instructions and examples. Its
main trust boundaries are the developer workstation, Git hooks, CI, and any
agent or tool that reads repository content.

| Asset | Threat | Required control |
| --- | --- | --- |
| Source and workflow instructions | Malicious or accidental committed secrets | `.gitignore`, secret scanning, review, private reporting |
| Git hook execution | Unexpected shell input or command injection | Strict shell mode, quoted variables, no eval, minimal commands |
| Generated application guidance | Insecure defaults copied into a service | `SECURITY.md`, explicit server-side validation and access-control requirements |
| Local credentials and outputs | Accidental disclosure through Git or logs | Ignore environment files and logs; never print credentials or request data |

Out of scope for this repository: runtime authentication, databases, network
services, uploads, CORS, cookies, rate limiting, and production TLS. Those
controls must be implemented and tested in each generated application where
those surfaces exist.

