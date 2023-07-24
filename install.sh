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
if [ "$1" = "rust" ]; then
	if ! (( $+commands[rustup] )); then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	fi
fi

# Python
if [ "$1" = "python" ]; then
	if ! (( $+commands[pyenv] )); then
		brew install pyenv
	fi
fi

# Poetry
if [ "$1" = "poetry" ]; then
	if ! (( $+commands[poetry] )); then
		curl -sSL https://install.python-poetry.org | python3 -
	fi
fi

# NVM
if [ "$1" = "nvm" ]; then
	if ! (( $+commands[nvm] )); then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
		export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

		nvm install 16
		nvm install default 16

		npm install --global yarn
	fi
fi

# Apply changes.
exec $SHELL
