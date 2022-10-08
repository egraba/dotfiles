#!/bin/zsh

# zsh
ZSHRC=~/.zshrc
if [ -f $ZSHRC ]; then
    echo "$ZSHRC is present."
    rm $ZSHRC
    echo "$ZSHRC has been deleted."
fi
ln -s $(pwd)/.zshrc $ZSHRC
echo "New $ZSHRC has been installed!"

# Neovim
VIMRC=~/.config/nvim/init.vim
if [ -f $VIMRC ]; then
    echo "$VIMRC is present."
    rm $VIMRC
    echo "$VIMRC has been deleted."
fi
ln -s $(pwd)/.vimrc $VIMRC
echo "New $VIMRC has been installed!"

# Apply changes.
exec $SHELL
