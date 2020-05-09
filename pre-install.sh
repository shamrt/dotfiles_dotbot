#!/usr/local/env sh

# OS-specific pre-installs
if [ $(uname) = "Darwin" ]; then
    . ./macos/pre-install.sh
elif [ $(uname) = "Linux" ]; then
    . ./linux/pre-install.sh
fi
