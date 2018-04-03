alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias cats='highlight -O ansi'

alias vim="nvim"

alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias treee="tree --dirsfirst -C"

alias node="nodejs"

alias gnome-control-center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias gnome-gnome-contacts="env XDG_CURRENT_DESKTOP=GNOME gnome-gnome-contacts"
alias gnome-settings-daemon="env XDG_CURRENT_DESKTOP=GNOME gnome-settings-daemon"

alias -g g="git"

alias -g onlyFilenames='ag -o "/?(\w+/?)*\.(\w+)$"'
