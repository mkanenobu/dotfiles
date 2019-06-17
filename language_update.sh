#!/bin/sh
cols="$(tput cols)"
separater="$(echo "===================================================================================================================================" | cut -c "1-${cols}")"

sepatate() {
  echo ""
  echo "${separater}"
  echo "${1}"
  echo "${separater}"
}

echo "Update languages and sevaral packages"

sepatate "Nimble"
nimble update

sepatate "Rustup"
rustup update

sepatate "Cargo update"
cargo install-update -a

sepatate "Yarn"
yarn global upgrade --no-lockfile

sepatate "Gem"
gem update

sepatate "pip"
pip list --outdated --format=json | jq -r '.[].name' | xargs pip install -U pip

sepatate "Opam"
opam update -y && opam upgrade -y && eval $(opam env)

