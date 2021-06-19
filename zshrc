# Disable control flow. (ctrl-s / ctrl-q)
stty stop '' -ixoff -ixon

# Dont raise errors when regex nomatch occurs
unsetopt nomatch

# Preserve history per pane
setopt nosharehistory

# Theme settings.
ZSH_THEME="geometry/geometry"
GEOMETRY_PROMPT_PLUGINS=(
  git
  kube
)

# Plugin declarations.
plugins=(
  asdf
  autojump
  aws
  bundler
  colored-man-pages
  common-aliases
  fzf
  gcloud
  git
  git-extras
  gitfast
  gpg-agent
  kubectl
  minikube
  tmux
  vi-mode
  zsh_reload
  zsh-syntax-highlighting
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
alias mktd="touch $(date +"%Y.%m.%d").wiki"
alias localip="ipconfig getifaddr en0"
alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"

# Hooks.
eval "$(direnv hook zsh)"
eval `keychain --quiet --eval --agents ssh id_rsa`

# Loaders.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
