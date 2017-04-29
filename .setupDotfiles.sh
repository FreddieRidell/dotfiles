#!/bin/bash

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
git clone --bare git@github.com:CodogoFreddie/dotfiles.git $HOME/dotfiles
config config --local status.showUntrackedFiles no
config status

pushd Documents
	git clone git@github.com:krypt-n/bar.git
	pushd bar
		make
		sudo make install
	popd
popd
