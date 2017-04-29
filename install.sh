#!/bin/bash

### install dotfiles
DOTDIR="$HOME"/Git/dotfiles
if [ -e ~/.bashrc ]; then
	mv ~/.bashrc ~/Documents/.bashrc.org
fi
ln -v "$DOTDIR"/.bashrc ~/.bashrc
ln -sv "$DOTDIR"/.inputrc ~/.inputrc
if [ -e ~/.profile ]; then
	mv ~/.profile ~/Documents/.profile.org
fi
ln -v "$DOTDIR"/.profile ~/.profile
#ln -sv "$DOTDIR"/user_dictionary.db ~/.mozc/user_dictionary.db
ln -sv "$DOTDIR"/.dein ~/.dein
if [! -e ~/.config/nvim ];then
	mkdir -p ~/.config
fi
ln -sv "$DOTDIR"/init.vim ~/.config/nvim/init.vim
ln -sv "$DOTDIR"/byobu ~/.config/byobu
ln -s "$DOTDIR"/init.vim ~/.vimrc
ln -sv "$DOTDIR"/.imwheelrc ~/.imwheelrc
