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

function gitrid {
    git fetch -p && for branch in `git branch -vv | grep ': gone]' | gawk '{print $1}'`; do git branch -D $branch; done
}

function largestFile {
	wc -l "$@" | sort -nr -t":" -k1 | head -2 | tail -1 | sed -e 's/[0-9]\+//'
}
