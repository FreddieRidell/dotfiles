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

function syncRepos {
	printAndEval pass git pull &&
		printAndEval pass git push ;

	printAndEval cortex status &&
		printAndEval cortex pull --all &&
		printAndEval cortex push --all ;

	printAndEval config status &&
		printAndEval config pull --all &&
		printAndEval config push --all ;
}

function updateAll {
	sudo ls
	syncRepos;
	sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y;
	sudo dnf upgrade -y ;

	yarn global upgrade --latest;
}

function setupMyNPM { 
	npm init
	
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

	npm add --save-dev @babel/cli @babel/core @freddieridell/babel-preset prettier eslint eslint-config-react-app eslint-plugin-flowtype eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react babel-eslint jest-cli
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

function resizeImageCommon {
	FILE_PATH=$1:t:r
	FILE_EXT=$1:t:e

	for SIZE in 8 16 32 64 128 192 256 512 1204 2048 4096 100 200 300 500 1000 2000 3000 5000 ; do
		echo convert "$1" -resize $SIZEx$SIZE "$FILE_PATH@$SIZE.$FILE_EXT" ;
		convert "$1" -resize $SIZEx$SIZE "$FILE_PATH@$SIZE.$FILE_EXT" ;
	done
}

function displayQRCode {
	read DATA;
	qrencode $DATA -o /tmp/qr.png;
	feh /tmp/qr.png;
	rm /tmp/qr.png;
}


function generateScreenshots {
	"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --screenshot=Square.png --window-size=5000,5000 --default-background-color=0 $1;
	"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --screenshot=Widescreen.png --window-size=5000,2812 --default-background-color=0 $1;
	"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --screenshot=Banner.png --window-size=6000,2000 --default-background-color=0 $1;

	resizeImageCommon Square.png
	resizeImageCommon Widescreen.png
	resizeImageCommon Banner.png
}
