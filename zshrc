if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"  ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export PATH="$PATH:`yarn global bin`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
 export DOCKER_BUILDKIT=1
