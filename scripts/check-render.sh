#!/usr/bin/env bash
set -euo pipefail
echo "Running Quarto render..."
quarto render --no-cache 2>&1 | tee /tmp/quarto-render.log
if grep -qi "error" /tmp/quarto-render.log; then
  echo "FAIL: Quarto render produced errors"
  exit 1
fi
echo "PASS: Quarto render completed without errors"
