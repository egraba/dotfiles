#!/bin/zsh

# zsh
ln -s $(pwd)/.zshrc ~/.zshrc

# Apply changes
exec $SHELL
