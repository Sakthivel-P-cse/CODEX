#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
python3 - <<'PY'
import json, re, subprocess
from pathlib import Path

rows = ['name | trigger | path']
for pattern in ('.agents/src/*','skills/*/SKILL.md'):
    for f in sorted(Path('.').glob(pattern)):
        if not f.is_file():
            continue
        lines = subprocess.check_output(['head','-n','5',f],text=True).splitlines()
        meta = (json.loads(lines[1]) if lines[1].startswith('{') else
                dict(line.split(': ',1) for line in lines if ': ' in line))
        trigger = re.split(r'(?<=\.)\s',meta['description'],maxsplit=1)[0]
        rows.append(f"{meta['name']} | {trigger} | {f}")
rows += ['', '## ECC']
triggers = {
    'database-reviewer':'Review database queries schemas and migrations',
    'java-build-resolver':'Resolve Java compiler and build failures',
    'java-reviewer':'Review Java code for correctness issues',
    'performance-optimizer':'Investigate performance bottlenecks and slow execution',
    'react-build-resolver':'Resolve React compilation and build failures',
    'react-reviewer':'Review React components hooks and rendering',
    'security-reviewer':'Review changes affecting application security boundaries',
    'typescript-reviewer':'Review TypeScript types and asynchronous behavior',
}
available = set(subprocess.check_output(['ls', 'ECC/agents'], text=True).splitlines())
ecc_rows = []
for name, trigger in triggers.items():
    assert len(trigger.split()) == 6, name
    if name + '.md' in available:
        ecc_rows.append(f'{name} | {trigger} | ECC/agents/{name}.md')
assert len(ecc_rows) + 1 <= 12
rows += ecc_rows
Path('.agents/INDEX.md').write_text('\n'.join(rows)+'\n')
PY
