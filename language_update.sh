#!/bin/sh
cols="$(tput cols)"
separater="$(echo "===================================================================================================================================" | cut -c "1-${cols}")"

echo "${separater}"
echo "Nimble"
echo "${separater}"
nimble update

echo 
echo "${separater}"
echo "Rustup"
echo "${separater}"
rustup update

echo 
echo "${separater}"
echo "Yarn"
echo "${separater}"
yarn global upgrade --no-lockfile

echo 
echo "${separater}"
echo "Gem"
echo "${separater}"
gem update

echo 
echo "${separater}"
echo "Opam"
echo "${separater}"
opam update && opam upgrade
