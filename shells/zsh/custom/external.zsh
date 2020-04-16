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

# fasd
eval "$(fasd --init auto)"
