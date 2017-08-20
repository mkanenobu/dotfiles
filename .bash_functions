#!/bin/bash

function open(){
    if [ ! -e "$1" ];then
        thunar . >/dev/null 2>&1
    else
        thunar "$@"
    fi
}

function mkdircd(){
    mkdir "$1" && cd "$1"
}

function countwords(){
    if [ -e "$1" ];then
        countstrings=$(cat "$1")
    else
        countstrings="$1"
    fi
    sleep 0.1s
    echo "${#countstrings}"
}

function off(){
    if test "$#" -eq 0; then
        shutdown -h 0
    elif test "$#" -eq 1; then
        shutdown -h "$1"
    else
        echo "error"
    fi
}

# unar extract multiple files
function unam(){
    for i in "$@"; do
        unar "$i"
    done
}

# Translate
function dict(){
    if [ -e ~/Documents/gene-utf8.txt ]; then
        grep "$1" "${HOME}"/Documents/ejdic-hand-utf8.txt -wi --color
    fi
#    if [ -e ~/Documents/gene-utf8.txt ]; then
#        grep "$1" "${HOME}"/Documents/gene-utf8.txt -A 1 -wi --color
#    else
#        curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Downloads/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt > ~/Documents/gene-utf8.txt
#    fi

}

function jtoe(){
    grep "$1" "${HOME}"/Documents/gene-utf8.txt -B 1 -w --color
}

function mp3encm(){
    for i in "$@"; do
        lame "$i" -b 256
    done
}

function opusencord(){
    opusfile=$(echo "$1" | sed -e 's/.wav/.opus/')
    if [ -z "$2" ]; then
        rate=160
    else
        rate="$2"
    fi
    opusenc "$1" "$opusfile" --bitrate "$rate"
}

function encopus(){
    for i in "$@"; do
        opusencord "$i"
    done
}

function soxspectrogram(){
    spectrofile=`echo "$1" | sed -re 's/(.wav|.ogg)//g'`
    sox "$1" -n spectrogram -x 1200 -o "$spectrofile"_spectrogram.png
}

