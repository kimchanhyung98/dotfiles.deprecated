#!/bin/bash

set -e

echo "[install-ai-pipx]"

if ! command -v pipx >/dev/null 2>&1; then
  exit 0
fi

# SuperClaude
if ! command -v SuperClaude >/dev/null 2>&1; then
  pipx install SuperClaude || true
  SuperClaude install --force --yes || true
fi

# SuperGemini
if ! command -v SuperGemini >/dev/null 2>&1; then
  pipx install SuperGemini || true
  SuperGemini install --force --yes || true
fi

echo "[install-ai-pipx] done"
