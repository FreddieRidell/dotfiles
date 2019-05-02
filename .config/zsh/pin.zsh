function pin() {
	PIN_FOLDER_QUEUE="$HOME/queue.pin"
	PIN_FOLDER_ARCHIVE="$HOME/archive.pin"

	mkdir -p $PIN_FOLDER_QUEUE
	mkdir -p $PIN_FOLDER_ARCHIVE

	case $1 in
		"add")
			NEW_FILE_NAME="$PIN_FOLDER_QUEUE/$(isoTime | sed -e "s/ /-/g")-$( echo $2 | sed -e "s/https*:\/\///g").pin";
			hedification $2 > $NEW_FILE_NAME;
			config add $NEW_FILE_NAME;
			config commit -m "added pin for $2";
			;;

		"read")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )

			echo opn $( jq -r ".url" < $FILE_NAME);
			opn $( jq -r ".url" < $FILE_NAME);

			;;
		"archive")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )
			URL=$( jq -r ".url" < $FILE_NAME);

			mv $FILE_NAME $PIN_FOLDER_ARCHIVE

			config add $PIN_FOLDER_ARCHIVE $PIN_FOLDER_QUEUE
			config commit -m "archived pin for $URL";
			;;
		"delete")
			FILE_NAME=$( find -L $PIN_FOLDER_QUEUE -type f | sort | fzf --reverse --preview="$CATTER {} --color always --style header" )
			URL=$( jq -r ".url" < $FILE_NAME);

			rm $FILE_NAME

			config add $PIN_FOLDER_ARCHIVE $PIN_FOLDER_QUEUE
			config commit -m "deleted pin for $URL";
			;;
	esac

}
