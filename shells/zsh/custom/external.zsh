#!/usr/bin/env bash

# `.external` handles all external tools.

# pj
PROJECT_PATHS=(~/code ~/code/workspaces ~/code/workspaces/ro)

# === Autocomplete ===

# npm
source <(npm completion)

# pyenv
eval "$(pyenv init -)"

# git-extras
source "$(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh"

# === z ===
# https://github.com/rupa/z

source "$(brew --prefix)/etc/profile.d/z.sh"
