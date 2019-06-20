# Disable control flow. (ctrl-s / ctrl-q)
stty stop '' -ixoff -ixon

# Dont raise errors when regex nomatch occurs.
unsetopt nomatch

# Preserve history per pane.
setopt nosharehistory

# Reduce zsh key delay.
export KEYTIMEOUT=1

# Editor
export EDITOR=nvim

# Locale.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Render tty gpg
export GPG_TTY=$(tty)

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to runtime directories.
export CARGO_HOME=$HOME/.cargo
export GOPATH=$HOME/.go

# PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$CARGO_HOME/bin:$PATH

# Theme settings.
ZSH_THEME="geometry/geometry"
GEOMETRY_PROMPT_PLUGINS=(
  git
)

# Disable auto title settings.
DISABLE_AUTO_TITLE="true"

# Plugin declarations.
plugins=(
  autojump
  aws
  bundler
  colored-man-pages
  common-aliases
  git
  git-extras
  gitfast
  gpg-agent
  kubectl
  tmux
  vi-mode
  zsh-syntax-highlighting
  zsh_reload
)

autoload -U compinit && compinit

# Sources.
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# Aliases.
alias v="nvim"
alias q="exit"
alias kns="kubens"
alias kctx="kubectx"
alias localip="ipconfig getifaddr en0"
alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"

# Hooks.
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"

# Loaders.
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
