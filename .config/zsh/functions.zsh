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
	ag -l "$1" "$2"
	ag -l "$1" "$2" | xargs -n 1 vim
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

	echo "Loading secret for $AWS_ACCESS_KEY_ID"
	export AWS_SECRET_ACCESS_KEY="$(pass $1)"

	echo "done"
}

function wifiConnectToStored {
	SSID="$( echo "$1" | sed -e "s/.\+\///" )"
	
	echo "Loading password for $SSID"
	PASS="$( pass $1 )"

	echo "Connecting to $SSID"
	nmcli d wifi connect $SSID password $PASS

	echo "done"
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

function isoTime {
	date -I ;
}

function findAndReplaceInFolder {
	ag $1 --files-with-matches | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}
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

function createAlpacaService {
	mkdir "$1"

	cd $1

	touch "$1Service.js"
	touch "$1Repository.js"
	touch "$1Transformer.js"

	mkdir __tests__

	echo "describe(\"$1Service\", () => {\n  it(\"fails\", () => {\n    expect(true).toBe(false);\n  })\n})" > "__tests__/$1Service.spec.js"
	echo "describe(\"$1Repository\", () => {\n  it(\"fails\", () => {\n    expect(true).toBe(false);\n  })\n})" > "__tests__/$1Repository.spec.js"
	echo "describe(\"$1Transformer\", () => {\n  it(\"fails\", () => {\n    expect(true).toBe(false);\n  })\n})" > "__tests__/$1Transformer.spec.js"

	touch "__tests__/$1Fixture.json"
	touch "__tests__/$1FixtureTransformed.json"
}

function vimFileAndTest {
  file="$1"
  testDir="$(dirname "$1")/__tests__"
  testFile="$(basename "$1")"
  testPath="$testDir/$( echo $testFile| sed -e "s/\.js/\.spec\.js/" )"
  vim -O $file $testPath
}

function vimFilesAndTests {
  for x in $@ ; do
    file=$x
    testDir="$(dirname "$x")/__tests__"
    testFile="$(basename "$x")"
    testPath="$testDir/$( echo $testFile| sed -e "s/\.js/\.spec\.js/" )"
    vim -O $file $testPath
  done
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
  pass git push &&

  echo "------------------------------"
  echo "            config            "
  echo "------------------------------"
  config status &&
  config pull &&
  config push &&

  echo "------------------------------"
  echo "             done            "
  echo "------------------------------"
}

function gitOpenSomeFromStaus {
  git status | fpp -c "vim -O"
}

function findReplaceIn {
  ag -l $1 $3 | xargs -n 1 -I '{}'   sed --in-place '{}' -e "s/$1/$2/g" 
}

function titleAndRun {
  title $* && $*
}

function jqModify {
	TMP_FILE_NAME="/tmp/$RANDOM.json"

	jq $1 $2 > $TMP_FILE_NAME

	mv $TMP_FILE_NAME $2
}

function setupMyNPM { 
	npm i --dev babel-cli prettier eslint babel-preset-freddie-ridell eslint-config-react-app 

	jqModify '.scripts.build = "babel src --out-dir lib"' package.json 
	jqModify '.scripts.format = "prettier --write src/**/*"' package.json 
	jqModify '.eslintConfig.extends = "react-app"' package.json 
	jqModify '.prettier.useTabs = true' package.json 
	jqModify '.prettier.tabWidth= 4' package.json 
	jqModify '.prettier.trailingComma = "all"' package.json 
	jqModify '.babel.presets[0] = "freddie-ridell"' package.json 
}
