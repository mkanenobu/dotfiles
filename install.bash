#!/bin/bash
### maybe not work

### install dotfiles
if [ ! -e "$HOME"/Git/dotfiles ];then
    mkdir -p "$HOME"/Git/dotfiles
fi
DOTDIR="$HOME"/Git/dotfiles
cd "$DOTDIR" || exit
XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/dotfiles_backups

link(){
    # symbolicLink or hardLink
    while getopts sh OPT; do
        case $OPT in
            s) style="symbolic";;
            h) style="hard";;
        esac
    done
    for FILE in "$@";do
        TO="$FILE"
        FILENAME="$(basename "$TO")"
        FROM="$DOTDIR/$FILENAME"
        if [ ! -e "$FROM" ];then
            echo "$FILENAME not found"
            exit
        fi
        # if exists
        if [ -e "$TO" ];then
            mv -r "$TO" "$XDG_CONFIG_HOME"/dotfiles_backups
            rm -r "$TO"
        else
            mkdir -p "$(dirname "$TO")"
        fi
        case "$style" in
            symbolic) \
                ln -sv "$FROM" "$TO" ;;
            hard) \
                ln -v "$FROM" "$TO" ;;
        esac
done
}
hlink(){
    for hlinkFile in "$@";do
        link -h "$hlinkFile"
    done
}
slink(){
    for slinkFile in "$@";do
        link -s "$slinkFile"
    done
}
# hardLink
hlink ~/.bashrc ~/.bash_functions ~/.profile
# symbolicLink
slink ~/.inputrc ~/.dein \
    ~/.config/nvim/init.vim ~/.config/byobu ~/.imwheelrc \
    ~/.config/Code/User/settings.json ~/.config/asunder \
    ~/.config/xfce4 \
    ~/.local/share/tools \
    ~/.config/peco/config.json

