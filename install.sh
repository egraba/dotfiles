#!/bin/zsh

install_file() {
	if [ -f $2 ]; then
		echo "$2 is present."
		rm $2
		echo "$2 has been deleted."
	fi
	ln -s $1 $2
	echo "New $2 has been installed!"
}

# omz
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
S_ZSHRC=$(pwd)/.zshrc
D_ZSHRC=~/.zshrc
install_file $S_ZSHRC $D_ZSHRC

# homebrew
if ! (( $+commands[brew] )); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Neovim
brew install neovim
S_VIMRC=$(pwd)/.vimrc
D_VIMRC=~/.config/nvim/init.vim
install_file $S_VIMRC $D_VIMRC

# Rust
if ! (( $+commands[rustup] )); then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

# SDKMAN
curl -s "https://get.sdkman.io" | bash 

# Apply changes.
exec $SHELL
