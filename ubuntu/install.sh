#!/bin/env sh

# Homebrew
IS_HOMEBREW_USER_INSTALLED=`test -d /home/linuxbrew/.linuxbrew`
IS_HOMEBREW_INSTALLED_LOCALLY=`test -d ~/.linuxbrew`

if ( ! $IS_HOMEBREW_USER_INSTALLED || ! $IS_HOMEBREW_USER_INSTALLED ); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  $IS_HOMEBREW_INSTALLED_LOCALLY && eval $(~/.linuxbrew/bin/brew shellenv)
  $IS_HOMEBREW_USER_INSTALLED && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >> ~/.zshrc
  brew analytics off
else
  echo "Homebrew already installed, skipping."
fi

# zsh
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
