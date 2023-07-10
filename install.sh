#!/bin/zsh

install_file() {
	if [ ! -f $1 ]; then
		echo "$1 not found!" >&2
		exit 1
	fi
	if [ -f $2 ]; then
		echo "$2 is present."
		rm $2
		echo "$2 has been deleted."
	fi
	ln -s $1 $2
	echo "New $2 has been installed!"
}

# omz
if ! (( $+ZSH )); then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
S_ZSHRC=$(pwd)/dot_zshrc
D_ZSHRC=~/.zshrc
install_file $S_ZSHRC $D_ZSHRC

# homebrew
if ! (( $+commands[brew] )); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/eric/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Neovim
if ! (( $+commands[nvim] )); then
	brew install neovim
fi
S_VIMRC=$(pwd)/dot_vimrc
D_VIMRC=~/.config/nvim/init.vim
install_file $S_VIMRC $D_VIMRC

# Rust
#if ! (( $+commands[rustup] )); then
#	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#fi

# Python
#if ! (( $+commands[pyenv] )); then
#	brew install pyenv
#fi

# Poetry
#if ! (( $+commands[poetry] )); then
#	curl -sSL https://install.python-poetry.org | python3 -
#fi

# Apply changes.
exec $SHELL
