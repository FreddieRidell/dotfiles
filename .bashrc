# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias config='/usr/bin/git --git-dir=/home/fedora/dotfiles/ --work-tree=/home/fedora'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
