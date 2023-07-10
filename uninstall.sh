#!/bin/zsh

# Homebrew
if (( $+commands[brew] )); then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi

# omz
sh $ZSH/tools/uninstall.sh
