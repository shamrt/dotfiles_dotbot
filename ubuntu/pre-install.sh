#!/bin/env sh

# zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
HOMEBREW_USER_DIR=/home/linuxbrew/.linuxbrew
HOMEBREW_LOCAL_DIR="$HOME/.linuxbrew"
IS_HOMEBREW_USER_INSTALLED=$(test -d "$HOMEBREW_USER_DIR")
IS_HOMEBREW_INSTALLED_LOCALLY=$(test -d "$HOMEBREW_LOCAL_DIR")

if ( ! $IS_HOMEBREW_USER_INSTALLED || ! $IS_HOMEBREW_USER_INSTALLED ); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  $IS_HOMEBREW_USER_INSTALLED && eval "$("$HOMEBREW_USER_DIR/bin/brew shellenv")"
  $IS_HOMEBREW_INSTALLED_LOCALLY && eval "$("$HOMEBREW_LOCAL_DIR/bin/brew shellenv")"

  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.zshrc
  brew analytics off
else
  echo "Homebrew already installed, skipping."
fi
