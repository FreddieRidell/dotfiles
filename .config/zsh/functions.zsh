function vimovergrep {
	echo "vimovergrep is a work in progress"
	echo "$1"
	echo "$2"
}

function getFolder () {
    echo ${\PWD##*/}
}

function title {
	echo -ne "\033]0;${1}\007"
}

function chpwd {
	title "$( getFolder )"
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
	for x in $( ag -l "$1" "$2" ) ; do vim $x ; done
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

function loadIAMCredentials {
	export AWS_ACCESS_KEY_ID="$( echo "$1" | sed -e "s/.\+\///" )"
	export AWS_SECRET_ACCESS_KEY="$(pass $1)"
}

function taskSaga {
	echo -n "Enter any metadata: "
	read meta
	ARGS=( ${(z)meta} )

	echo "Please enter the first task"

	prevTaskId=""
	resp=""

	while read -r line; do
		if [ -n "$prevTaskId" ]; then
			resp="$(task add depends:$prevTaskId $ARGS \"$line\" )"
		else
			resp="$(task add $ARGS \"$line\" )"
		fi

		prevTaskId="$( echo "$resp" | sed -e "s/\w\+ \w\+ \([0-9]\+\)\./\1/" )"

		echo -n "After $line, then: "
	done
}

function createS3Website {
	aws s3 mb "s3://$1" ;
	aws s3 mb "s3://www.$1" ;
	aws s3 website "s3://$1" --index-document index.html --error-document index.html ;
	aws s3api put-bucket-policy --bucket "$1" --policy "{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Sid\": \"AddPerm\", \"Effect\": \"Allow\", \"Principal\": \"*\", \"Action\": \"s3:GetObject\", \"Resource\": \"arn:aws:s3:::$1/*\" } ] }" ;
	aws s3api put-bucket-website --bucket "www.$1" --website-configuration "{ \"RedirectAllRequestsTo\": { \"HostName\": \"$1\", \"Protocol\": \"https\" } }" ;
}

function unixTime {
	date +%s ;
}

function findAndReplaceInFolder {
	ag $1 --files-with-matches | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}
}
