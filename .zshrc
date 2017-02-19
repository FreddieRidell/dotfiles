[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export ZSH=~/.oh-my-zsh

export VISUAL=vim
export EDITOR="$VISUAL"
export SSH_KEY_PATH="~/.ssh/dsa_id"

ZSH_THEME="theunraveler"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"

plugins=( git npm aws node )
