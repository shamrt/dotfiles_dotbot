#!/usr/bin/env bash

# `.exports` is used to provide custom variables.

BREW_PREFIX=$(brew --prefix)

# === Compiler flags ===

# This is required because `openssl` is keg-only in `brew`,
# see: `brew info openssl` for more information.
if [[ $(uname) = "Darwin" ]]; then
    export LDFLAGS="-L/usr/local/opt/openssl/lib"
    export CPPFLAGS="-I/usr/local/opt/openssl/include"
    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
    export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
fi

# === Path modifications ===

# These lines should be the first ones

# GPG agent:
PATH="$BREW_PREFIX/opt/gpg-agent/bin:$PATH"

# Adds `pipsi` and `pipx` binary files:
PATH="$HOME/.local/bin:$PATH"

# postgres@9.6 utilities like `psql`:
PATH="$BREW_PREFIX/opt/postgresql@9.6/bin:$PATH"

# npm:
PATH="$BREW_PREFIX/share/npm/bin:$PATH"

# SQLite
PATH="$BREW_PREFIX/opt/sqlite/bin:$PATH"

# OpenSSL
PATH="$BREW_PREFIX/opt/openssl@1.1/bin:$PATH"

# python2 (required by npm and other tools, installed via pyenv):
PATH="$PATH:$HOME/.pyenv/versions/2.7.17/bin"

# Postgres
PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

export PATH

# === General ===

# Editor:
export EDITOR=$(command -v vi)

# GPG:
export GPG_TTY=$(tty)
eval "$(gpg-agent --daemon --allow-preset-passphrase >/dev/null 2>&1)"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8'

# Homebrew:
export HOMEBREW_NO_ANALYTICS=1 # disables statistics that brew collects

# Pagers:
# This affects every invocation of `less`.
#
#   -i   case-insensitive search unless search string contains uppercase letters
#   -R   color
#   -F   exit if there is less than one page of content
#   -X   keep content on screen after exit
#   -M   show more info at the bottom prompt line
#   -x4  tabs are 4 instead of 8
export LESS="-iRFXMx4"
export PAGER='less'
export MANPAGER='less'

# === Version managers ===

# nvm:
export NVM_DIR="$HOME/.nvm"
source "$BREW_PREFIX/opt/nvm/nvm.sh"

# pyenv:
[[ -e $(pyenv init -) ]] && eval "$(pyenv init -)"

# rbenv:
[[ -e $(rbenv init -) ]] && eval "$(rbenv init -)"

# rustup:
[[ -e $HOME/.cargo/bin ]] && source "$HOME/.cargo/env"

# phpbrew:
[[ -e "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

# === Histories ===

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY="$HOME/.node_history"
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy'

# Erlang and Elixir shell history:
export ERL_AFLAGS="-kernel shell_history enabled"

# === Code highlight ===
# https://github.com/zsh-users/zsh-syntax-highlighting

# We won't highlight code longer than 200 chars, because it is slow:
export ZSH_HIGHLIGHT_MAXLENGTH=200

# === Notifications ===
# https://github.com/MichaelAquilina/zsh-auto-notify

export AUTO_NOTIFY_THRESHOLD=30
export AUTO_NOTIFY_EXPIRE_TIME=5000

# === Utilities ===

# byobu
export BYOBU_PREFIX=$BREW_PREFIX
