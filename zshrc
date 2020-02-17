# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export PATH="`yarn global bin`:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

ZSH_THEME="simple"

plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias tmux='tmux -u'

export DOCKER_BUILDKIT=1

export AWS_SDK_LOAD_CONFIG=true
export COLORTERM=truecolor
export BROWSER=none
