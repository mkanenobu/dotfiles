#!/bin/bash
ls -a $HOME/git/dotfiles/.??* --ignore=".git" | xargs cp -t $HOME/ -rfv

if [ ! -e $HOME/.config/nvim/ ]; then
	mkdir $HOME/.config/nvim
fi
cp -fv $HOME/git/dotfiles/init.vim $HOME/.config/nvim/
