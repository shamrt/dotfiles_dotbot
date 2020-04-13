# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme is set via `antibody`, see `config/antibody.txt`.
# ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="false"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"
HIST_IGNORE_SPACE="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  brew
  bundler
  common-aliases
  extract
  gitfast
  node
  nvm
  per-directory-history
  pj
  python
  vscode
  z
  zsh_reload
)

if [[ uname = "Darwin" ]]; then
  plugins = (
    "${plugins[@]}"
    macos
  )
fi

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/snap/bin"

# Custom envs:
#source "$ZSH/oh-my-zsh.sh"
#source "$HOME/.shell_env"

fpath=($fpath "/home/smartin/.zfunctions")

# completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Spaceship prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_TIME_SHOW=true

# Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh syntax highlighting
. "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
