#!/bin/bash
ls -a $HOME/Git/dotfiles/.??* --ignore=".git" | xargs cp -t $HOME/ -rfv

if [ ! -e $HOME/.config/nvim/ ]; then
	mkdir $HOME/.config/nvim
fi
cp -fv $HOME/Git/dotfiles/init.vim $HOME/.config/nvim/
