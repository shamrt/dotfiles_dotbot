#!/usr/bin/env sh

# ---------------
# Homebrew
# ---------------

# fzf
"$HOMEBREW_PREFIX/opt/fzf/install"

# ---------------
# Node
# ---------------

# nvm
export NVM_DIR="$HOME/.nvm"

mkdir -p $NVM_DIR



# spaceship theme
npm install -g spaceship-prompt
