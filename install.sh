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

# zsh
S_ZSHRC=$(pwd)/.zshrc
D_ZSHRC=~/.zshrc
install_file $S_ZSHRC $D_ZSHRC

# Neovim
S_VIMRC=$(pwd)/.vimrc
D_VIMRC=~/.config/nvim/init.vim
install_file $S_VIMRC $D_VIMRC

# Apply changes.
exec $SHELL
