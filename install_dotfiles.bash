#!/bin/bash
set Ceu

backupDir="${HOME}/dotfiles_bak"
mkdir "${backupDir}"

install(){
  sourceFilePath="$1"
  destDir="$2"
  filename="$(basename "${sourceFilePath}")"
  if [ ! -e "${destDir}" ]; then
    mkdir -p "${destDir}"
  fi
  if [ -e "${destDir}/${filename}" ]; then
    mv "${destDir}/${filename}" "${backupDir}"
  fi
  ln -s "${sourceFilePath}" "${destDir}/${filename}"
}

dotfiles="$(find "$(pwd)" -maxdepth 1 -mindepth 1)"
configDir="${HOME}/.config"

for i in $dotfiles ;do
  case "$i" in
    "init.vim" ) install "$i" "${configDir}/nvim" ;;
    "neosnippet-snippets" ) install "snippets" "${configDir}/nvim" ;;
    "dein" ) "$i" "${configDir}/nvim" ;;
    "byobu"  ) install "$i" "${configDir}" ;;
    ".bashrc"  ) install "$i" "${HOME}" ;;
    ".vimrc"  ) install "$i" "${HOME}" ;;
    ".bash_functions" ) install "$i" "${HOME}" ;;
    ".imwheelrc" ) install "$i" "${HOME}" ;;
    ".inputrc" ) install "$i" "${HOME}" ;;
    ".Xmodmap" ) install "$i" "${HOME}" ;;
    * ) : ;;
  esac
done
