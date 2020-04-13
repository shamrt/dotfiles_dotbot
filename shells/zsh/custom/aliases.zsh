#!/usr/bin/env bash

# `.aliases` is used to provide custom variables.

# === Aliases ===

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/code/workspaces"
alias g="git"

# Sorts directories in top, colors, and prints `/` at directories:
alias ls="/usr/local/bin/gls --color -h --group-directories-first -F"

# Pretty print XML (use `jq` for json):
alias xq="xmllint --format"

# Show local ip:
alias localip="ipconfig getifaddr en0"

# Get week number
alias week='date +%V'

# Calculator:
# https://github.com/arzzen/calc.plugin.zsh
cc() {
  python3 -c "from math import *; print($*);"
}

alias cc='noglob cc'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Start a web server in any folder 
alias www='python -m SimpleHTTPServer 8000'

#
# MacOS-specific
#

if [[ uname = "Darwin" ]]; then
  # Lock the screen (when going AFK)
  alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

  # Copy public key to clipboard:
  alias pubkey="cat ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

  # Google Chrome
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

  # IP addresses
  alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
  alias localip="ipconfig getifaddr en0"
  alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

  # Show active network interfaces
  alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

  # Trim new lines and copy to clipboard
  alias c="tr -d '\n' | pbcopy"

  # Recursively delete `.DS_Store` files
  alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

  # Show/hide hidden files in Finder
  alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

  # URL-encode strings
  alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

  # Merge PDF files
  # Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
  alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'
fi
