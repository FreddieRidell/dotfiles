#!/bin/bash

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:CodogoFreddie/dotfiles.git $HOME/dotfiles
config config --local status.showUntrackedFiles no
git reset --hard master
git reset --hard HEAD
config status

chsh -s $( which zsh ) $USER

# this is needed, but not checked in
touch ~/.config/zsh/env.zsh
