# Reduce zsh key delay
export KEYTIMEOUT=1

# FZF default command
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --color never --no-messages --glob "!.git/"'

# Editor
export EDITOR=nvim

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Render tty gpg
export GPG_TTY=$(tty)

# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Disable auto title settings.
export DISABLE_AUTO_TITLE="true"

# Python fix
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Path to runtime directories.
export CARGO_HOME=$HOME/.cargo
export GOPATH=$HOME/.go

# PATH
export PATH="/usr/local/sbin:$PATH"
export PATH=$CARGO_HOME/bin:$PATH
export PATH=$GOPATH/bin:$PATH

