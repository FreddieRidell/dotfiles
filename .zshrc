[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

ZSH_THEME="theunraveler"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=( git npm aws node )

#TODO: Remove
#export ZSH=$HOME/.oh-my-zsh
#source $ZSH/oh-my-zsh.sh

source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/prompt.zsh
