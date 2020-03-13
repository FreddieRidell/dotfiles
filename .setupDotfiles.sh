#!/bin/bash -i

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
git clone --recurse-submodules --bare git@github.com:FreddieRidell/dotfiles.git $HOME/dotfiles
config config --local status.showUntrackedFiles no
config reset --hard master
config reset --hard HEAD
config status

alias cortex='/usr/bin/git --git-dir=$HOME/cortex/ --work-tree=$HOME'
git clone --recurse-submodules --bare git@github.com:FreddieRidell/cortex.git $HOME/cortex
cortex config --local status.showUntrackedFiles no
cortex reset --hard master
cortex reset --hard HEAD
cortex status

# this is needed, but not checked in
touch ~/.config/zsh/env.zsh
