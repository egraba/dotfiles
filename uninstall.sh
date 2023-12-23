#!/bin/zsh

# Homebrew
if (( $+commands[brew] )); then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
	# Cleanup .zprofile to avoid errors display at terminal startup.
	sed -i '' -e '/homebrew/d' ~/.zprofile
	sed -i '' -e '/^$/d' ~/.zprofile
fi

# omz
sh $ZSH/tools/uninstall.sh
# Cleanup all .zshrc files (including backups from omz uninstall).
find . -type f \( -name ".zshrc*" \) -delete