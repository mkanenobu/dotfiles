#inclide ubuntu-setup.sh
#!/bin/bash
if [ ! -e $HOME/git/ ]; then
	mkdir -p $HOME/git/
	mkdir -p $HOME/git/dotfiles/
fi
ls -a $HOME/git/dotfiles/.??* --ignore=".git" | xargs cp -t $HOME/ -rfv

if [ ! -e $HOME/.config/nvim/ ]; then
	mkdir -p $HOME/.config/nvim/
fi
cd -fv $HOME/git/dotfiles/init.vim $HOME/.config/nvim/
