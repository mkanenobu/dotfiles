#inclide ubuntu-setup.sh
#!/bin/bash
la $HOME/git/dotfiles/.??* --ignore=".git" | xargs cp -t $HOME/ -rfv
cd -fv $HOME/git/dotfiles/init.vim $HOME/.config/nvim/
