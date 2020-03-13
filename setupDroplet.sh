#!/bin/bash

adduser freddie
usermod -aG sudo freddie
su - freddie
ssh-keygen
