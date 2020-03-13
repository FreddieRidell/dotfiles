#!/bin/bash 

echo 
echo adding new package sources
echo yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
echo neovim
sudo add-apt-repository ppa:neovim-ppa/stable

echo 
echo apt update
sudo apt update

echo 
echo apt upgrade
sudo apt upgrade

echo 
echo apt install packages
sudo apt install \
  git \
  pkg-config \
  neovim \
  nodejs \
  npm \
  yarn \
  zsh

echo
echo enabaling zsh as default shell
chsh -s $( which zsh ) $USER

echo
echo installing rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo
echo installing rusty-zsh-prompt
cargo install --git https://github.com/FreddieRidell/rusty-zsh-prompt.git

echo
echo installing vim plugins
vim -c :PlugInstall

