#!/bin/bash
ls -a ~/Git/dotfiles/.??* --ignore=".git" | xargs cp -t ~/ -rfv

if [ ! -e ~/.config/nvim/ ]; then
	mkdir ~/.config/nvim
fi
cp -fv ~/Git/dotfiles/init.vim ~/.config/nvim/
if [ ! -e ~/.mozc ]; then
	mkdir ~/.mozc
fi
cp -v user_dictionary.db ~/.mozc/
