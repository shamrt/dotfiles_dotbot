#!/usr/bin/env bash

# `.external` handles all external tools.

# pj
PROJECT_PATHS=(~/code ~/code/workspaces ~/code/workspaces/ro)

# === Autocomplete ===

# npm
source <(npm completion) 

# pyenv
eval "$(pyenv init -)"

# === z ===
# https://github.com/rupa/z

source "$(brew --prefix)/etc/profile.d/z.sh"
