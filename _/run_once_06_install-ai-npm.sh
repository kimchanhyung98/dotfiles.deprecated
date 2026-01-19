#!/bin/bash

set -e

echo "[install-ai-npm]"

if ! command -v npm >/dev/null 2>&1; then
  exit 0
fi

# auggie
if ! command -v auggie >/dev/null 2>&1; then
  npm install -g @augmentcode/auggie || true
  auggie --login || true
fi

# claude
if ! command -v claude >/dev/null 2>&1; then
  npm install -g @anthropic-ai/claude-code || true
  claude login || true
fi

# codex
if ! command -v codex >/dev/null 2>&1; then
  npm install -g @openai/codex || true
  # rm ~/.codex/auth.json
  codex login || true
fi

# gemini
if ! command -v gemini >/dev/null 2>&1; then
  npm install -g @google/gemini-cli || true
  gemini || true
fi

echo "[install-ai-npm] done"
