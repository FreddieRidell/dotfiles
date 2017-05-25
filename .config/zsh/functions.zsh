function vimovergrep {
	echo "vimovergrep is a work in progress"
	echo "$1"
	echo "$2"
}

function title {
	echo -ne "\033]0;${1}\007"
}

function sleepo {
	systemctl suspend
}

function lesss {
	cats $1 | less -r
}
