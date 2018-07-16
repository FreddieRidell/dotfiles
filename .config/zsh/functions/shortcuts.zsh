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

function isoTime {
	date -I ;
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

function jotNew {
  FOLDER_NAME="$HOME/Pad/$( isoTime | sed -e "s/-/\//" | sed -e "s/-.*//" )"
  FILE_NAME="$HOME/Pad/$( isoTime | sed -e "s/-/\//" | sed -e "s/-/\//" )-$( echo $* | sed -e "s/ /-/g" ).md"
  mkdir -p $FOLDER_NAME

  echo "# $( echo $* | sed 's/.*/\L&/; s/[a-z]*/\u&/g' )" >> $FILE_NAME

  $EDITOR $FILE_NAME
}

function jotFind {
  $EDITOR $( find -L $HOME/Pad -type f | fzf --reverse --preview="cat {}" )
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
  sudo apt-get update && sudo apt-get upgrade ;
  sudo dnf upgrade ;
  yarn global upgrade-interactive --latest;
}

function cabalDUCSGS { 
  cabal --key dat://88a978f3ce3bd7c7e9aecfc4bf19d34b2ae44b0e2356c295a995163cd3aa2e9e --nick freddie
}

function cabalCabal {
  cabal --key dat://59813e3169b4b2a6d3741b077f80cce014d84d67b4a8f9fa4c19605b5cff637f --nick freddieridell                                                                                                                                  []
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
	echo 'require("./lib")' > index.js

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
