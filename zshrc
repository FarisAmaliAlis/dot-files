# Disable control flow (ctrl-s / ctrl-q)
stty stop '' -ixoff -ixon

# Dont raise errors when regex nomatch fires
unsetopt nomatch

# ==============================================================================
# Core settings
# ==============================================================================
# Path to your oh-my-zsh installation.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME='geometry/geometry'
GEOMETRY_SYMBOL_KUBE=" "
GEOMETRY_PROMPT_PLUGINS=(git kube)

# Disable auto title setting
DISABLE_AUTO_TITLE="true"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preserve history per pane
setopt nosharehistory

# ==============================================================================
# Plugins declarations
# ==============================================================================
plugins=(
  autojump
  aws
  colored-man-pages
  common-aliases
  git
  gpg-agent
  kubectl
  tmux
  vi-mode
  zsh-completions
  zsh-syntax-highlighting
  zsh_reload
)

# ==============================================================================
# Sources
# ==============================================================================
# oh-my-zsh
source $ZSH/oh-my-zsh.sh
# kubectl
source <(kubectl completion zsh)

# ==============================================================================
# Aliases
# ==============================================================================
alias v="nvim"
alias q="exit"
alias ec="emacsclient -c"
alias et="emacsclient -t"
alias kns="kubens"
alias kctx="kubectx"
alias localip="ipconfig getifaddr en0"
alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"

# ==============================================================================
# Exports
# ==============================================================================
# 256 color support
export TERM=xterm-256color

# Editor settings
export EDITOR="nvim"
export MYNVIMRC="~/.config/nvim/init.vim"

# Environments
export KEYTIMEOUT=1

# Directories
export GOPATH="$HOME/.go"
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

# PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# GPGTTYP
export GPG_TTY=$(tty)

# ==============================================================================
# Hooks
# ==============================================================================
eval "$(direnv hook zsh)"

# ==============================================================================
# Loaders
# ==============================================================================
[ -n "$TMUX" ] && export TERM=screen-256color
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -f ~/.kube-geometry.zsh ] && source ~/.kube-geometry.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
