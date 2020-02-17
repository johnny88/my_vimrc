# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:`yarn global bin`"
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Path to your oh-my-zsh installation.
export ZSH="/home/johnny/.oh-my-zsh"

export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

ZSH_THEME="robbyrussell"

plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
export DOCKER_BUILDKIT=1
