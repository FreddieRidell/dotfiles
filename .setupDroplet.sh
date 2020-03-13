#!/bin/bash

BOLD=$(tput bold)
CLEAR=$(tput sgr0)

echo Creating user $BOLDfreddie
adduser freddie

echo Adding $BOLDfreddie$CLEAR to group $BOLDsudo
usermod -aG sudo freddie

echo Generating ssh key for $BOLDfreddie
su freddie -c ssh-keygen

echo Setting up config for $BOLDfreddie
su freddie -c 'sh -c "$(wget https://raw.githubusercontent.com/CodogoFreddie/dotfiles/master/.setupDotfiles.sh -O -)"'
su - freddie 
