alias ls="ls --color"

source $HOME/.xinitrc

#Force US keyboard layout
if ! type "setxkbmap" > /dev/null; then
	setxkbmap us
fi
