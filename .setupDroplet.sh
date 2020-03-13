#!/bin/bash

echo Creating user freddie
adduser freddie

echo Adding freddie to group sudo
usermod -aG sudo freddie

echo Generating ssh key for freddie
su freddie -c ssh-keygen

echo Setting up config for freddie
su freddie -c 'sh -c "$(wget https://raw.githubusercontent.com/CodogoFreddie/dotfiles/master/.setupDotfiles.sh -O -)"'
su - freddie 
