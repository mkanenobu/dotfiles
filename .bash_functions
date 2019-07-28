#!/bin/bash

dash() {
  query="${1}"
  if [ "$#" -gt 1 ]; then
    query="${query}:${2}"
  fi
  (zeal "${query}" >/dev/null 2>&1 &)
}

bunexec() {
  rerun "bundle exec ${1}"
}

# Git
gl(){
  if type "tig" >/dev/null 2>&1 ;then
    tig
  else
    git log
  fi
}

# Docker
dremove(){
  if [ "$#" != 0 ]; then
    sudo docker rm "$@"
  else
    container_id="$(sudo docker ps -a | sed -e '1d' | fzf | cut -d " " -f 1)"
    sudo docker rm "$container_id"
  fi
}

dkill(){
  if [ "$#" != 0 ]; then
    sudo docker kill "$@"
  else
    container_id="$(sudo docker ps | sed -e '1d' | fzf | cut -d " " -f 1)"
    sudo docker kill "$container_id"
  fi
}

# multipurpose open
open(){
  if [ "$#" == 0 ]; then
    (nautilus . >/dev/null 2>&1 &)
  elif [ "$#" -gt 1 ];then
    echo "This command can take only 1 args"
    return 1
  elif [[ "$1" == *.html ]];then
    google-chrome "$1" >/dev/null 2>&1
  elif [[ "$1" == *.md ]];then
    (typora "$1" >/dev/null 2>&1 &)
  else
    xdg-open "$1" >/dev/null 2>&1
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
    if [ -z "$1" ]; then
      exit 1
    fi
    if expr "$1" : '[a-zA-Z]*' >/dev/null ;then
      grep "$1" "${HOME}/Documents/gene-utf8.txt" -A 1  -wi --color
    else
      grep "$1" "${HOME}/Documents/gene-utf8.txt" -B 1  -wi --color
    fi
  else
    curl http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz >> ~/Downloads/gene95.tar.gz && tar xfvz ~/Downloads/gene95.tar.gz -C ~/Downloads && nkf ~/Downloads/gene.txt > ~/Documents/gene-utf8.txt
  fi
}

# php storm
phpstorm(){
  (phpstorm.sh "$1" >/dev/null 2>&1 &)
}

encopus(){
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

history-do(){
  if [ "$#" -eq 1 ];then
    eval "$(tac ~/.bash_history | grep -v "^#" | grep "$1" | peco)"
  else
    eval "$(tac ~/.bash_history | grep -v "^#" | peco)"
  fi
}

mvexec(){
  if [ ! -e "$1" ]; then
    mkdir "$1"
  fi
  find . -maxdepth 1 -type f -perm 775 -exec mv {} "$1" \; \
    && echo "Done"
}

encrypt_file(){
  openssl enc -e -aes256 -in "$1" -out "$2"
}

decrypt_file(){
  openssl enc -d -aes256 -in "$1" -out "$2"
}

convertToUtf-8(){
  find . -type f -exec nkf -w -Lu --overwrite {} \;
}

git_remove_from_remote(){
  git rm --cached -r "$@"
}

mail2me(){
  echo -n "Subject: "
  read -r subject
  echo "Text (Enter 'end' to send): "
  text=""
  while read -r line; do
    if [ "${line}" == "end" ]; then
      break
    fi
    text="${text}
${line}"
  done

  echo -n "${text}" | mail -s "${subject}" "${my_mail_address}" || echo "Failed to sent an mail"
}

mail2(){
  echo -n "To: "
  read -r mail_address
  echo -n "Subject: "
  read -r subject
  echo "Text (Enter 'end' to send): "
  text=""
  while read -r line; do
    if [ "${line}" == "end" ]; then
      break
    fi
    text="${text}
${line}"
  done

  echo -n "${text}" | mail -s "${subject}" "${mail_address}" || echo "Failed to sent an mail"
}
