# List of complete settings: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#zsh
# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git colored-man-pages colorize python brew macos)

# Update settings
zstyle ':omz:update' mode disabled

# Completion settings
COMPLETION_WAITING_DOTS=true

# End of omz settings
source $ZSH/oh-my-zsh.sh

# Enables extended globbing patterns
setopt extended_glob

export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"

# For GPG and Ghostty
export GPG_TTY=$(tty)

# aliases
alias vi=nvim
alias vim:nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
