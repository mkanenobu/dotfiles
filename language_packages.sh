#!/bin/sh

echo "Nimble"
nimble update

echo "Rustup"
rustup update

echo "Yarn"
yarn global upgrade --no-lockfile

echo "Gem"
gem update

echo "Stack"
stack update

