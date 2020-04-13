#!/usr/bin/env bash

# `.external` handles all external tools.

# pj
PROJECT_PATHS=(~/code ~/code/workspaces ~/code/workspaces/ro)

# === Autocomplete ===

source <(npm completion) # adds normal autocomplete to `npm` commands

# === z ===
# https://github.com/rupa/z

source "$(brew --prefix)/etc/profile.d/z.sh"
