#!/bin/bash

set -e

echo "[ohmyzsh-setting]"

# 1. Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 2. 플러그인 설치
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
[ -d "$HOME/.oh-my-zsh" ] && mkdir -p "$ZSH_CUSTOM_DIR/plugins"

if [ -d "$HOME/.oh-my-zsh" ] && [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"
fi
if [ -d "$HOME/.oh-my-zsh" ] && [ ! -d "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_DIR/plugins/zsh-syntax-highlighting"
fi

echo "[ohmyzsh-setting] done"
