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

function freddieFixFormat {
	for f in $( yarn run format | grep \"/home/freddie\" ) ; do vim $f ; done
}

function openXinY {
	for x in $( grep "$1" -lr "$2" ) ; do vim $x ; done
}

function s3rmb {
	aws s3 rm --recursive "s3://$1"  && aws s3 rb "s3://$1"
}

function pushMessage {
	curl \
		--data-binary "{\"type\": \"note\", \"title\": \"$1\", \"body\":\"$2\"}" \
		--header "Access-Token: $PUSH_BULLET_TOKEN" \
		--header "Content-Type: application/json" \
		--request POST \
		https://api.pushbullet.com/v2/pushes | python -m json.tool
}
