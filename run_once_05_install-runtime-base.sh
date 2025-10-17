#!/bin/bash

set -e

# 런타임/패키지 매니저 설치
echo "[install-runtime-base]"

# 1. pipx
if ! command -v pipx >/dev/null 2>&1; then
  brew install pipx || true
fi

pipx ensurepath || true
if ! grep -q 'export PATH="$HOME/.local/bin' "$HOME/.zshrc" 2>/dev/null; then
  export PATH="$HOME/.local/bin:$PATH"
  echo "install pipx"
fi

# 2. bun
if ! command -v bun >/dev/null 2>&1; then
  curl -fsSL https://bun.sh/install | bash
  export PATH="$HOME/.bun/bin:$PATH"
  if ! grep -q 'export PATH="$HOME/.bun/bin' "$HOME/.zshrc" 2>/dev/null; then
    echo 'export PATH="$HOME/.bun/bin:$PATH"' >> "$HOME/.zshrc"
  fi
  echo "install bun"
fi

# 3. npm
if ! command -v npm >/dev/null 2>&1; then
  brew install node
fi

echo "[install-runtime-base] done"
