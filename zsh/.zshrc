#
# OMZ settings
#
# List of complete settings: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#zsh
#

# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=agnoster
plugins=(git colored-man-pages colorize python brew macos)

# Completion settings
COMPLETION_WAITING_DOTS=true

# Library settings
ENABLE_CORRECTION=true

#
# End of OMZ settings
#
source $ZSH/oh-my-zsh.sh

# Enables extended globbing patterns
setopt extended_glob

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"

# For GPG and Ghostty
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Machine-specific config and secrets (untracked)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
