#!/bin/bash

BOLD=$(tput bold)
CLEAR=$(tput sgr0)

echo Creating user ${BOLD}freddie
adduser freddie

echo Adding ${BOLD}freddie${CLEAR} to group ${BOLD}sudo
usermod -aG sudo freddie

echo Generating ssh key for ${BOLD}freddie
su freddie -c ssh-keygen

echo Setting up config for ${BOLD}freddie
su freddie -c 'sh -c "$(wget https://raw.githubusercontent.com/CodogoFreddie/dotfiles/master/.setupDotfiles.sh -O -)"'
su - freddie 
