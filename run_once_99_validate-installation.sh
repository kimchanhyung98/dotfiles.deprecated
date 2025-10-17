#!/bin/bash

set -e

echo "[validate-installation]"

# 공용 출력 함수 (간결하게 ok/ng만 표시)
ok(){ echo "[ok] $1"; }
ng(){ echo "[ng] $1"; }

# 커맨드 확인
assert_cmd(){ if command -v "$1" >/dev/null 2>&1; then ok "cmd:$1"; else ng "cmd:$1"; fi }

# 디렉터리 존재 확인
assert_dir(){ if [ -d "$1" ]; then ok "dir:$2"; else ng "dir:$2"; fi }

# defaults 값 확인
assert_defaults(){
  local domain="$1" key="$2" expected="$3"
  local value
  value=$(defaults read "$domain" "$key" 2>/dev/null || true)
  if [ "$value" = "$expected" ]; then
    ok "defaults:${domain}.${key}"
  else
    ng "defaults:${domain}.${key} expected=$expected got=${value:-<none>}"
  fi
}

# 1. OhMyZsh
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
assert_dir "$HOME/.oh-my-zsh" "~/.oh-my-zsh"
assert_dir "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" "zsh-autosuggestions"
assert_dir "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" "zsh-syntax-highlighting"

# 2. 런타임/CLI
assert_cmd pipx
assert_cmd bun
# npm 기반 AI CLI
assert_cmd auggie
assert_cmd claude
assert_cmd codex
assert_cmd gemini
# pipx 기반 AI CLI
assert_cmd SuperClaude
assert_cmd SuperGemini

# 3. 기타
# GitHub 복제 디렉터리 존재/비어있지 않은지(선택)
GIT_DIR="$HOME/Documents/GitHub"
if [ -d "$GIT_DIR" ] && [ "$(ls -A "$GIT_DIR" 2>/dev/null | wc -l | tr -d ' ')" != "0" ]; then
  ok "github-dir:$GIT_DIR"
else
  ng "github-dir:$GIT_DIR"
fi

# Opcode(Claudia) 디렉터리
assert_dir "$HOME/opcode" "~/opcode"

echo "[validate-installation] done"
