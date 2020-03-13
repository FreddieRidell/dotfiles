#!/bin/bash

echo
echo Creating user freddie
adduser freddie

echo
echo Adding freddie to group sudo
usermod -aG sudo freddie

echo
echo Generating ssh key for freddie
su freddie -c ssh-keygen

echo
echo now paste the following ssh key into github
cat /home/freddie/.ssh/id_rsa.pub
echo and the run the following command to setup config:
echo 'sh -c "$(wget https://raw.githubusercontent.com/CodogoFreddie/dotfiles/master/.setupDotfiles.sh -O -)"'

su - freddie 
