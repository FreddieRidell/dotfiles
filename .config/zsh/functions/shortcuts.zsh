function createS3Website {
	aws s3 mb "s3://$1" ;
	aws s3 mb "s3://www.$1" ;
	aws s3 website "s3://$1" --index-document index.html --error-document index.html ;
	aws s3api put-bucket-policy --bucket "$1" --policy "{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Sid\": \"AddPerm\", \"Effect\": \"Allow\", \"Principal\": \"*\", \"Action\": \"s3:GetObject\", \"Resource\": \"arn:aws:s3:::$1/*\" } ] }" ;
	aws s3api put-bucket-website --bucket "www.$1" --website-configuration "{ \"RedirectAllRequestsTo\": { \"HostName\": \"$1\", \"Protocol\": \"https\" } }" ;
}

function gitRebaseFrom {
	CURRENT_BRANCH="$( gitCurrentBranch )"
	printAndEval git checkout $1 &&
	
	printAndEval git pull &&

	printAndEval git checkout $CURRENT_BRANCH &&

	printAndEval git rebase -i $1
}

function gitMergeFrom {
	CURRENT_BRANCH="$( gitCurrentBranch )"
	printAndEval git checkout $1 &&
	
	printAndEval git pull &&

	printAndEval git checkout $CURRENT_BRANCH &&

	printAndEval git merge $1
}

function blogNew {
	if [ ! -d "$HOME/Documents/freddieridell.com" ]; then
		pushd "$HOME/Documents/"
		git clone git@github.com:CodogoFreddie/freddieridell.com.git
		popd
	fi

	FILE_NAME="$HOME/Documents/freddieridell.com/src/drafts/$( echo $* | sed -e "s/ /-/g" ).md"
	vim $FILE_NAME

	pushd ~/Documents/freddieridell.com
	git add $FILE_NAME
	git commit -m "added draft $*"
	popd
}

function blogFind {
	pushd "$HOME/Documents/freddieridell.com/src/drafts"
	FILE_NAME=$( find -L . -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )

	vim $FILE_NAME

	git add $FILE_NAME
	git commit -m "updated draft $FILE_NAME"
	popd
}

function jotNew {
	FILE_NAME="$HOME/jot/$( echo $* | sed -e "s/ /-/g" ).md"

	echo "# $( echo $* | sed 's/.*/\L&/; s/[a-z]*/\u&/g' )" > $FILE_NAME
	echo "" >> $FILE_NAME
	echo "## $(isoDate)" >> $FILE_NAME

	vim + -- $FILE_NAME
	prettier --write $FILE_NAME

	config add $FILE_NAME > /dev/null
	config commit -m "jot" > /dev/null
}

function jotFind {
	FILE_NAME=$( find -L $HOME/jot -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )

	TODAYS_DATE="$(isoDate)"

	if grep -q $TODAYS_DATE $FILE_NAME ;
	then
		echo "ye" ;
	else ;
		echo "\n## $TODAYS_DATE" >> $FILE_NAME
	fi

	vim + -- $FILE_NAME
	prettier --write $FILE_NAME

	config add $FILE_NAME > /dev/null
	config commit -m "jot" > /dev/null
}

function syncRepos {
	echo "------------------------------"
	echo "             pass             "
	echo "------------------------------"
	pass git pull && pass git push ;

	echo "------------------------------"
	echo "            config            "
	echo "------------------------------"
	config status && config pull --all && config push --all ;

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

function setupMyNPM { 
	npm init
	npm add --save-dev @babel/cli @babel/core @freddieridell/babel-preset prettier eslint eslint-config-react-app eslint-plugin-flowtype eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react babel-eslint jest-cli

	# setup package.json
	jqModify '.babel.presets[0] = "@freddieridell/babel-preset"' package.json 
	jqModify '.eslintConfig.extends = "react-app"' package.json 
	jqModify '.files[1] = "/lib"' package.json 
	jqModify '.files[2] = "/main.js"' package.json 
	jqModify '.main = "lib/index.js"' package.json 
	jqModify '.prettier.tabWidth = 4' package.json 
	jqModify '.prettier.trailingComma = "all"' package.json 
	jqModify '.prettier.useTabs = true' package.json 
	jqModify '.scripts.build = "NODE_ENV=production babel src --out-dir lib"' package.json 
	jqModify '.scripts.format = "prettier --write src/**/*"' package.json 
	jqModify '.scripts.prepushOnly = "npm run format && && npm run test && npm run build"' package.json 
	jqModify '.scripts.test = "NODE_ENV=test jest --coverage true src test"' package.json 
	jqModify '.scripts.test_watch = "NODE_ENV=test jest src test --watch --bail --runInBand"' package.json 
	jqModify '.scripts.watch = "NODE_ENV=staging babel src --out-dir lib --watch"' package.json 

	# setup .gitignore
	echo "/lib" >> .gitignore
	echo "node_modules" >> .gitignore

	# setup files
	mkdir -p src
	touch src/index.js

	echo '#!/usr/bin/env node' > main.js
	echo 'require("./lib")' >> main.js
	echo 'module.exports = require("./lib");' > index.js

	chmod +x main.js
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

