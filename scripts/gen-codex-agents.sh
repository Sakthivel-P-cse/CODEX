#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
python3 - "$@" <<'PY'
import json, sys, tomllib
from pathlib import Path

sources = Path('.agents/src')
for f in ([sources / (sys.argv[1] + '.md')] if len(sys.argv) > 1 else sorted(sources.glob('*.md'))):
    _, header, body = f.read_text().split('---\n', 2)
    meta = dict(line.split(': ', 1) for line in header.splitlines())
    name = meta['name']
    assert name == f.stem
    mode = 'workspace-write' if name == 'silent-failure-hunter' or 'Write' in meta['tools'].split(', ') else 'read-only'
    fields = dict(name=name, description=meta['description'], sandbox_mode=mode)
    content = ''.join(f'{k} = {json.dumps(v, ensure_ascii=False)}\n' for k,v in fields.items())
    escaped = body.replace('\\', '\\\\').replace('"""', '\\"\\"\\"')
    content += '\ndeveloper_instructions = """\n' + escaped + '"""\n'
    assert tomllib.loads(content) == dict(fields, developer_instructions=body)
    if len(sys.argv) > 1:
        sys.stdout.write(content)
    else:
        Path('.codex/agents', name + '.toml').write_text(content)
PY
