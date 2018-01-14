#!/bin/bash

open(){
    if [ ! -e "$1" ];then
        thunar . >/dev/null 2>&1
    elif [[ "$1" == *.html ]];then
        google-chrome "$1" >/dev/null 2>&1
    else
        thunar "$@" >/dev/null 2>&1
    fi
}

countwords(){
    if [ -e "$1" ];then
        countstrings=$(cat "$1")
    else
        countstrings="$1"
    fi
    sleep 0.1s
    echo "${#countstrings}"
}

off(){
    if test "$#" -eq 0; then
        shutdown -h 0
    elif test "$#" -eq 1; then
        shutdown -h "$1"
    else
        echo "error"
    fi
}

# unar extract multiple files
unam(){
    for i in "$@"; do
        unar "$i"
    done
}

# Translate
dict(){
    if [ -e ~/Documents/gene-utf8.txt ]; then
        grep "$1" "${HOME}"/Documents/gene-utf8.txt -A 1  -wi --color
    else
        curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Downloads/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt > ~/Documents/gene-utf8.txt
    fi
}

jtoe(){
    grep "$1" "${HOME}"/Documents/gene-utf8.txt -B 1 -w --color
}

encopus(){
    opusfile=$(echo "$1" | sed -e 's/.wav/.opus/')
    if [ -z "$2" ]; then
        rate=160
    else
        rate="$2"
    fi
    opusenc "$1" "$opusfile" --bitrate "$rate"
}

encopusm(){
    for encordfiles in "$@";do
        encopus "$encordfiles"
    done
 }

soxspectrogram(){
    spectrofile=$(echo "$1" | sed -re 's/.wav//g')
    sox "$1" -n spectrogram -x 1200 -o "$spectrofile"_spectrogram.png
}

generate_m3u(){
    generate_file=$(basename "$(pwd)" | sed -e "s/\$/.m3u/g")
    echo '#EXTM3U' >> "$generate_file"
    ls ./*.opus >> "$generate_file"
}

cp2multi(){
    echo "${@:2}" | xargs -n 1 cp -v "$1"
}

repeat_yes(){
    if [ "$#" -le 1 ] ;then
        echo "repeat_yes [Command] [Times]"
    else
        yes "$1" | head -n "$2" | sh
    fi
}

elastic(){
    grep -rnw "$1" -e "$2"
}

chrome_reload_tab(){
    xdotool windowfocus $(xdotool search --onlyvisible --name google)
    xdotool key ctrl+r
    xdotool windowfocus $(xdotool search --onlyvisible --class gnome-terminal)
}

say(){
    TMP=/tmp/jsay.wav
    echo "$1" | open_jtalk -m /usr/share/hts-voice/mei_happy.htsvoice -x /var/lib/mecab/dic/open-jtalk/naist-jdic -ow "$TMP" && mpv "$TMP"
    rm -f "$TMP"
}

