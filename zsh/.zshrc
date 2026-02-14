# -------------------------------------------------------------------
# Oh My Zsh
# -------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    docker
    docker-compose
    python
    pip
    virtualenv
    z
    fzf
    command-not-found
)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# General
# -------------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# -------------------------------------------------------------------
# Path
# -------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------
alias vim="nvim"
alias v="nvim"
alias ll="ls -lah"
alias la="ls -A"
alias ..="cd .."
alias ...="cd ../.."

# Git shortcuts
alias gs="git status"
alias gd="git diff"
alias gc="git commit"
alias gp="git push"
alias gl="git lg"

# Docker
alias dc="docker compose"

# -------------------------------------------------------------------
# Local overrides (not tracked by git)
# -------------------------------------------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
