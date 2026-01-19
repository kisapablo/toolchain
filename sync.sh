#!/bin/bash

cp -R $HOME/.config/nvim/ ./
cp -R $HOME/.config/kitty/ ./
cp -R $HOME/.config/tmux/ ./

if [ -f $HOME/.bash_aliases ]; then
	cp $HOME/.bash_aliases ./
else
	echo "No .bash_aliases file found in home directory."
fi
