function pin() {
	PIN_FOLDER_QUEUE="$HOME/queue.pin"
	PIN_FOLDER_ARCHIVE="$HOME/archive.pin"

	mkdir -p $PIN_FOLDER_QUEUE
	mkdir -p $PIN_FOLDER_ARCHIVE

	case $1 in
		"add")
			NEW_FILE_NAME="$PIN_FOLDER_QUEUE/$(isoTime | sed -e "s/ /-/g")-$( echo $2 | sed -e "s/https*:\/\///g" -e "s/\//_/g" ).pin";
			hedification $2 > $NEW_FILE_NAME &&
			cortex add $NEW_FILE_NAME &&
			cortex commit -m "added pin for $2";
			;;

		"read")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )

			printAndEval open-cli $( jq -r ".url" < $FILE_NAME);
			echo "Moving $FILE_NAME to archive"

			mv $FILE_NAME $PIN_FOLDER_ARCHIVE

			cortex add $PIN_FOLDER_ARCHIVE $PIN_FOLDER_QUEUE
			cortex commit -m "archived pin for $URL";

			;;
		"archive")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )
			URL=$( jq -r ".url" < $FILE_NAME);

			mv $FILE_NAME $PIN_FOLDER_ARCHIVE

			cortex add $PIN_FOLDER_ARCHIVE $PIN_FOLDER_QUEUE
			cortex commit -m "archived pin for $URL";
			;;
		"delete")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )
			URL=$( jq -r ".url" < $FILE_NAME);

			rm $FILE_NAME

			cortex add $PIN_FOLDER_ARCHIVE $PIN_FOLDER_QUEUE
			cortex commit -m "deleted pin for $URL";
			;;

		*)
			echo "pin add|read|archive|delete";
			;;
	esac

}

function jotNew {
	FILE_NAME="$HOME/jot/$( echo $* | sed -e "s/ /-/g" ).md"

	echo "# $( echo $* | sed 's/.*/\L&/; s/[a-z]*/\u&/g' )" > $FILE_NAME
	echo "" >> $FILE_NAME
	echo "## $(isoDate)" >> $FILE_NAME

	vim + -- $FILE_NAME
	prettier --write $FILE_NAME

	cortex add $FILE_NAME > /dev/null
	cortex commit -m "jot" > /dev/null
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

	cortex add $FILE_NAME > /dev/null
	cortex commit -m "jot" > /dev/null
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
		cortex add $DID_FILE > /dev/null
		cortex commit -m "did $*" > /dev/null
	else 
		less +G ~/did
	fi
}
