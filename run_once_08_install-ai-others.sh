#!/bin/bash

set -e

echo "[install-ai-others]"

if ! command -v bun >/dev/null 2>&1; then
  exit 0
fi

# Opcode (Claudia)
OPCODE_DIR="$HOME/opcode"
if [ ! -d "$OPCODE_DIR" ]; then
  git clone https://github.com/getAsterisk/opcode.git "$OPCODE_DIR" || true
  cd "$OPCODE_DIR"
  bun install || true
  bun run tauri build || true
fi

echo "[install-ai-others] done"
