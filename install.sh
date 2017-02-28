#!/bin/bash

### install dotfiles
DOTDIR="$HOME"/Git/dotfiles
ln -v "$DOTDIR"/.bashrc ~/.bashrc
ln -sv "$DOTDIR"/.inputrc ~/.inputrc
ln -v "$DOTDIR"/.profile ~/.profile
ln -sv "$DOTDIR"/user_dictionary.db ~/.mozc/user_dictionary.db
ln -sv "$DOTDIR"/.dein ~/.dein
ln -sv "$DOTDIR"/init.vim ~/.config/nvim/init.vim
ln -sv "$DOTDIR"/byobu ~/.config/byobu
ln -s "$DOTDIR"/init.vim ~/.vimrc
