[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

ZSH_THEME="theunraveler"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"

export ZSH=$HOME/.oh-my-zsh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"

export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export VISUAL=vim
export EDITOR="$VISUAL"
export SSH_KEY_PATH="~/.ssh/dsa_id"

source $ZSH/oh-my-zsh.sh

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cats='highlight -O ansi'

plugins=( git npm aws node )

#Various Yarn global install paths
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#custom functions
function vimovergrep {
	for f in $( grep $1 $2 ) ;
	do
		echo "opening $f"
		nvim $f
	done
}

# pretty cat
