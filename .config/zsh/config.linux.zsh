alias ls="ls --color"

#Force US keyboard layout
if ! type "setxkbmap" > /dev/null; then
	setxkbmap us
fi
