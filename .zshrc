# List of complete settings: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#zsh
# Main settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git colored-man-pages colorize python brew macos)
ZSH_CUSTOM=$HOME/development/projects/dotfiles/zsh-custom

# Update settings
zstyle ':omz:update' mode disabled

# Completion settings
COMPLETION_WAITING_DOTS=true

# End of omz settings
source $ZSH/oh-my-zsh.sh

setopt extended_glob

export PATH="$HOME/.local/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
