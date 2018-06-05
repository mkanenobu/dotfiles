#!/bin/bash

sshToEc2(){
    . ~/.env
    ssh -i "$ec2_key" ec2-user@"$1"
}
open(){
    if [ "$#" == 0 ];then
        thunar . >/dev/null 2>&1
    elif [ "$#" -gt 1 ];then
        echo "This command can take only 1 args"
        return 1
    elif [[ "$1" == *.html ]];then
        google-chrome "$1" >/dev/null 2>&1
    else
        xdg-open "$1" >/dev/null 2>&1
    fi
}

off(){
    if test "$#" -eq 0; then
        killall chrome && sleep 1
        shutdown -h 0
    elif test "$#" -eq 1; then
        shutdown -h "$1"
    else
        echo "error"
    fi
}

# unar extract multiple files
mnar(){
    for i in "$@"; do
        unar "$i"
    done
}

# Translate
dict(){
    if [ -e ~/Documents/gene-utf8.txt ]; then
        if expr "$1" : '[a-zA-Z]*' >/dev/null ;then
            grep "$1" "${HOME}"/Documents/gene-utf8.txt -A 1  -wi --color
        else
            grep "$1" "${HOME}"/Documents/gene-utf8.txt -B 1  -wi --color
        fi
    else
        curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Downloads/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt > ~/Documents/gene-utf8.txt
    fi
}

encopus(){
    #opusfile=$(echo "$1" | sed -e 's/.wav/.opus/')
    opusfile=${1//.wav/.opus}
    if [ -z "$2" ]; then
        rate=160
    else
        rate="$2"
    fi
    opusenc "$1" "$opusfile" --bitrate "$rate"
}

gen_spectrogram(){
    #spectrofile=$(echo "$1" | sed -re 's/.wav//g')
    spectrofile=${1//.wav/}
    sox "$1" -n spectrogram -x 1200 -o "$spectrofile"_spectrogram.png
}

generate_m3u(){
    generate_file=$(basename "$(pwd)" | sed -e "s/\$/.m3u/g")
    echo '#EXTM3U' >> "$generate_file"
    ls ./*.opus >> "$generate_file"
}

repeat_yes(){
    if [ "$#" -le 1 ] ;then
        echo "repeat_yes [Command] [Times]"
    else
        yes "$1" | head -n "$2" | sh
    fi
}

elastics(){
    rg -nws "$1" "$2"
}

tab_reload(){
    xdotool windowfocus $(xdotool search --onlyvisible --name google)
    xdotool key ctrl+r
    xdotool windowfocus $(xdotool search --onlyvisible --class gnome-terminal)
}

history-do(){
    if [ "$#" -eq 1 ];then
        eval "$(tac ~/.bash_history | grep -v ^# | grep "$1" | peco)"
    else
        eval "$(tac ~/.bash_history | grep -v ^# | peco)"
    fi
}

moveExecutableFile(){
    mkdir nim_excutable
    find . -maxdepth 1 -type f -perm 775 -exec mv {} nim_excutable \; \
        && echo "Done"
}

say(){
    TMP=/tmp/jsay.wav
    echo "$1" | open_jtalk -m /usr/share/hts-voice/mei_happy.htsvoice -x /var/lib/mecab/dic/open-jtalk/naist-jdic -ow "$TMP" && mpv "$TMP"
    rm -f "$TMP"
}

gpoc(){
    current_branch="$(git branch | grep \* | sed -e "s/\*\ //")"
    echo "Push to $current_branch"
    if [ "$current_branch" = "master" ]; then
        read -rp "Are you sure?:" confirm
        if [ "$confirm" = "y" ]; then
            git push origin master
        else
            echo ""
        fi
    else
        git push origin "$current_branch"
    fi
}

gcr(){
    g++ "$1"
    ./a.out
}

