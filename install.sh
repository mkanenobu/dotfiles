#inclide ubuntu-setup.sh
#!/bin/bash
if [ ! -e $HOME/git/ ]; then
	mkdir -p $HOME/git/
fi
ls -a $HOME/git/dotfiles/.??* --ignore=".git" | xargs cp -t $HOME/ -rfv
cd -fv $HOME/git/dotfiles/init.vim $HOME/.config/nvim/
