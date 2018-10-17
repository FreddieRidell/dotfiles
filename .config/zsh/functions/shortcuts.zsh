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

function isoDate {
  date -I
}

function isoTime {
	date +"%Y-%m-%d %H:%M:%S" 
}

function yarnClearLink {
	yarn unlink $1 && rm -rf node_modules && yarn install
}

function gitCurrentBranch {
	git symbolic-ref -q --short HEAD
}

function gitJira {
	if [ $1 ]; then
		git commit -m "$( gitCurrentBranch | sed -e 's,.*/\(.*\),\1,' | sed -e 's/-/ /g' -e 's/ /-/' -e 's/ .\+//' ) $*";
	else 
		git commit -m "$( gitCurrentBranch | sed -e 's,.*/\(.*\),\1,' | sed -e 's/-/ /g' -e 's/ /-/')";
	fi
}

function gitBranchJira {
	NEW_BRANCH_NAME="$( echo "$*" | tr "[:upper:]" "[:lower:]" | sed -e "s/-/ /g" -e "s/ /-/g" -e 's/\(\w\+\)/\U\1/' )"
	git checkout master && git pull && git checkout -b "$NEW_BRANCH_NAME" && git push -u origin "$NEW_BRANCH_NAME"
}

function gitRebaseFromMaster {
	CURRENT_BRANCH="$( gitCurrentBranch )"
	git checkout master && git pull && git checkout $CURRENT_BRANCH && git rebase master
}

function gitRebaseFromRelease {
	CURRENT_BRANCH="$( gitCurrentBranch )"
	git checkout release && git pull && git checkout $CURRENT_BRANCH && git rebase release
}

function jotNew {
	FILE_NAME="$HOME/jot/$( echo $* | sed -e "s/ /-/g" ).md"

	echo "# $( echo $* | sed 's/.*/\L&/; s/[a-z]*/\u&/g' )" > $FILE_NAME
	echo "" >> $FILE_NAME
	echo "## $(isoDate)" >> $FILE_NAME

	vim $FILE_NAME
	prettier --write $FILE_NAME

	config add $FILE_NAME > /dev/null
	config commit -m "jot" > /dev/null
}

function jotFind {
	FILE_NAME=$( find -L $HOME/jot -type f | sort | fzf --reverse --preview="cat {}" )

	TODAYS_DATE="$(isoDate)"

	if grep -q $TODAYS_DATE jot/hypercortex-notes.md ;
	then
		echo "ye" ;
	else ;
		echo "\n## $TODAYS_DATE" >> $FILE_NAME
	fi

	vim $FILE_NAME
	prettier --write $FILE_NAME

	config add $FILE_NAME > /dev/null
	config commit -m "jot" > /dev/null
}

function syncRepos {
	echo "------------------------------"
	echo "             pass             "
	echo "------------------------------"
	pass git pull &&
		pass git push ;

	echo "------------------------------"
	echo "            config            "
	echo "------------------------------"
	config status &&
		config pull &&
		config push ;

	echo "------------------------------"
	echo "             done            "
	echo "------------------------------"
}

function updateAll {
	sudo ls
	syncRepos ;
	sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y;
	sudo dnf upgrade -y ;
	yarn global upgrade --latest;
}

function cabalDUCSGS { 
	cabal --key dat://88a978f3ce3bd7c7e9aecfc4bf19d34b2ae44b0e2356c295a995163cd3aa2e9e --nick freddieRidell
}

function cabalCabal {
	cabal --key cabal://7d99b453506b9743bf5e71fe749f66c814d7cd9388a5d394a27eed4c5640302b --nick freddieRidell
}

function jqModify {
	TMP_FILE_NAME="/tmp/$RANDOM.json"

	jq $1 $2 > $TMP_FILE_NAME

	mv $TMP_FILE_NAME $2
}

function setupMyNPM { 
	npm add --save-dev babel-cli prettier eslint babel-preset-freddie-ridell eslint-config-react-app eslint-plugin-flowtype eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react babel-eslint

	NAME="$( jq '.name' package.json )"

	# setup package.json
	jqModify '.babel.presets[0] = "freddie-ridell"' package.json 
	jqModify ".bin.$NAME = \"./main.js\"" package.json
	jqModify '.eslintConfig.extends = "react-app"' package.json 
	jqModify '.files[0] = "/index.js"' package.json 
	jqModify '.files[0] = "/lib"' package.json 
	jqModify '.files[0] = "/main.js"' package.json 
	jqModify '.prettier.tabWidth= 4' package.json 
	jqModify '.prettier.trailingComma = "all"' package.json 
	jqModify '.prettier.useTabs = true' package.json 
	jqModify '.scripts.build = "babel src --out-dir lib"' package.json 
	jqModify '.scripts.format = "prettier --write src/**/*"' package.json 
	jqModify '.scripts.watch = "babel src --out-dir lib --watch"' package.json 

	# setup .gitignore
	echo "/lib" >> .gitignore
	echo "node_modules" >> .gitignore

	# setup files
	mkdir -p src
	touch src/index.js
	touch index.js

	echo '#!/usr/bin/env node' > main.js
	echo 'require("./lib")' >> main.js
	echo 'module.exports = require("./lib");' > index.js

	chmod +x main.js
}

function gitPoke {
	git commit --amend --date="now"
}

function gitResetToOrigin {
	git reset --hard "origin/$( gitCurrentBranch )"
}

function lock { 
	~/.i3/lock.sh
}

function pingMeDaddy {
	while true ; do
		ping 1.1.1.1 ;
		sleep 1
	done
}

function touchh {
	for x in $@ ; do ;
		mkdir -p $( dirname $x ) && touch $x ;
	done ;
}

function did {
	DID_FILE=~/did

	if [ "$#" -ne 0 ] ; then
		ENTRY="$(isoTime) ($(echo $HOST | cut -c -9 ))\t  $*"

		MOST_RECENT_DATE=$( tail -1 $DID_FILE | cut -c1,-10 - )
		THIS_DATE=$( echo $ENTRY | cut -c1,-10 - )

		if [ $MOST_RECENT_DATE != $THIS_DATE ] ; then
			echo "" >> $DID_FILE
		fi

		echo $ENTRY >> $DID_FILE

		tail -10 $DID_FILE
		config add $DID_FILE > /dev/null
		config commit -m "did" > /dev/null
	else 
		less ~/did
	fi
}

function jestDevelop {
	npm test -- --watchAll --runInBand --bail
}

function swatch {
	for x in {0..1}; do 
		for i in {30..37}; do 
			for a in {40..47}; do 
				echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
			done
			echo
		done
	done
	echo ""
}

function getLocalDevices {
	for x in `hostname -I` ; do
		IP=`echo $x | sed "s/[0-9]*$/255/"`
		ping $IP -b -c 2
	done  

	arp -a | column -t | sort
}
