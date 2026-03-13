#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"
MSG="${1:-notes: sync}"
git pull --rebase
git add .
if ! git diff --cached --quiet; then
  git commit -m "$MSG"
fi
git push
