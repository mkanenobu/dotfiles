#!/bin/bash

### install dotfiles
DOTDIR="$HOME"/Git/dotfiles
if [ -e ~/.bashrc ]; then
	mv ~/.bashrc ~/Documents/.bashrc.org
fi
ln -v "$DOTDIR"/.bashrc ~/.bashrc
ln -v "$DOTDIR"/.bash_functions ~/.bash_functions
ln -sv "$DOTDIR"/.inputrc ~/.inputrc
if [ -e ~/.profile ]; then
	mv ~/.profile ~/Documents/.profile.org
fi
ln -v "$DOTDIR"/.profile ~/.profile
if [ ! -e ~/.mozc ];then
	mkdir ~/.mozc
fi
ln -sv "$DOTDIR"/user_dictionary.db ~/.mozc/user_dictionary.db
ln -sv "$DOTDIR"/.dein ~/.dein
if [ ! -e ~/.config/nvim ];then
	mkdir -p ~/.config/nvim
fi
ln -sv "$DOTDIR"/init.vim ~/.config/nvim/init.vim
ln -sv "$DOTDIR"/byobu ~/.config/byobu
ln -sv "$DOTDIR"/init.vim ~/.vimrc
ln -sv "$DOTDIR"/.imwheelrc ~/.imwheelrc
if [ ! -e ~/.config/Code/User ];then
	mkdir -p ~/.config/Code/User
fi
ln -sv "$DOTDIR"/setting.json ~/.config/Code/User/setting.json
ln -s "$DOTDIR"/asunder ~/.config/asunder
if [ -e ~/.config/xfce4 ]; then
    rm -rf ~/.config/xfce4
fi
ln -sv "$DOTDIR"/xfce4 ~/.config/xfce4
