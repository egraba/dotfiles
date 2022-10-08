#!/bin/zsh

# zsh
ln -s $(pwd)/.zshrc ~/.zshrc

# Neovim
ln -s $(pwd)/.vimrc ~/.config/nvim/init.vim

# Apply changes
exec $SHELL
