###############################################################################################
# Environment variables
###############################################################################################

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export ZSH="$HOME/.oh-my-zsh"
export NODENV_ROOT="$HOME/.nodenv"
export RBENV_ROOT="$HOME/.rbenv"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="/opt/homebrew/bin:$PATH"

###############################################################################################
# ZSH Settings and plugins
###############################################################################################

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=(
  dnf
  git
  docker
  zsh-syntax-highlighting
  zsh-autosuggestions
)

###############################################################################################
# Runtime scripts
###############################################################################################

# nodenv, rbenv, pyenv
eval "$(nodenv init -)"
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Powerlevel10k
source $HOME/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################################################
# Aliases
###############################################################################################

# Docker
if [ -x "$(command -v docker)" ]; then
  alias dkr-nuke="docker system prune --all --volumes --force"
  alias dkr-containers="docker container ls -a"
  alias dkr-images="docker image ls -a"
  alias dkr-volumes="docker volume ls"
  alias dkr-networks="docker network ls"
fi

# ColorLS
if [ -x "$(command -v colorls)" ]; then
  alias ls="colorls --dark"
fi

###############################################################################################
# Auto-generated configuration
###############################################################################################
