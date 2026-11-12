#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
python3 - <<'PY'
import subprocess
import sys
import tomllib
from pathlib import Path

failed = False

def check(label, operation):
    global failed
    try:
        detail = operation()
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        failed = True
        print(f'FAIL {label}: {error}')
    else:
        print(f'PASS {label}: {detail}')

def index_paths():
    count = 0
    for line in Path('.agents/INDEX.md').read_text().splitlines():
        if not line.strip() or line.startswith('#') or line == 'name | trigger | path':
            continue
        fields = [field.strip() for field in line.split('|')]
        if len(fields) != 3 or not fields[2]:
            raise ValueError(f'invalid index row: {line}')
        if not Path(fields[2]).exists():
            raise ValueError(f'missing path: {fields[2]}')
        count += 1
    if not count:
        raise ValueError('no indexed paths')
    return f'{count} exist'

def agent_tomls():
    files = sorted(Path('.codex/agents').glob('*.toml'))
    if not files:
        raise ValueError('no agent TOML files')
    sources = {p.stem for p in Path('.agents/src').glob('*.md')}
    outputs = {p.stem for p in files}
    if sources != outputs:
        raise ValueError(f'unpaired agent names: {sorted(sources ^ outputs)}')
    for path in files:
        with path.open('rb') as stream:
            tomllib.load(stream)
        generated = subprocess.check_output(['sh', 'scripts/gen-codex-agents.sh', path.stem])
        if path.read_bytes() != generated:
            raise ValueError(f'{path} is stale; run scripts/gen-codex-agents.sh')
    return f'{len(files)} parse and match their sources'

def context_size():
    output = subprocess.check_output(
        ['wc', '-c', 'AGENTS.md', '.agents/INDEX.md'], text=True, stderr=subprocess.PIPE
    )
    size = int(output.splitlines()[-1].split()[0])
    return f'{size} bytes (~{size / 4:.0f} tokens)'

check('INDEX paths', index_paths)
check('agent TOML', agent_tomls)
check('AGENTS.md + INDEX.md', context_size)
sys.exit(1 if failed else 0)
PY
