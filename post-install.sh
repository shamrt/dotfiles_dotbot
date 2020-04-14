#!/usr/bin/env sh

# Initialize Zsh config
. "$HOME/.zshrc"

# ---------------
# Homebrew
# ---------------

# fzf
"$(brew --prefix)/opt/fzf/install"

# git-lfs
git lfs install

# ---------------
# Node
# ---------------

# nvm
export NVM_DIR="$HOME/.nvm"

mkdir -p $NVM_DIR

# spaceship theme
npm install -g spaceship-prompt

