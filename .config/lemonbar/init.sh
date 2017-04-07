#!/bin/bash

BACKGROUND="#272822"
WHITE="#eeeeee"
RED="#f92672"
ORANGE="#fd971f"
YELLOW="#e6db74"
GREEN="#a6e22e"
BLUE="#66d9ef"
PURPLE="#ae81ff"

function getDropboxStatus(){
	if [ " " = " " ] ; then
		echo "%{F$BLUE}%{A:dropbox stop:}$( dropbox status )%{A}%{F-}"
	else
		echo "%{F$BLUE}%{A:dropbox start:}$( dropbox status )%{A}%{F-}"
	fi
}

function getMemory(){
	MEM="$( free -h | head -2 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/Mem: \3\/\2/g")"
	SWAP="$( free -h | head -3 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/Swp: \3\/\2/g")"
	echo "$MEM $SWAP"
}

function getVolume(){
	LOUDEST_VOLUME="$( awk -F"[][]" '/Playback/ { print $2 }' <(amixer sget Master) | sort | uniq | head -2 | tail -1 )"
	echo "Vol: $LOUDEST_VOLUME"
}

function getNetwork(){
	SSID="$( iwconfig wlo1 | grep "ESSID:\".*\"" -oh | sed 's/ESSID:"\(.*\)"/\1/' )"
	WIFI_IP="$( ifconfig wlo1 | head -2 | tail -1 | sed "s/.*inet \(\S\+\).*/\1/g" )"

	echo "%{F$GREEN}$WIFI_IP $SSID%{F-}"
}

function getPartitionUsage(){
	PERCENTAGE_USAGE="$( df | tail --lines=+2 | sed -e "s/\(\S\+\s\+\)\{4\}//" | grep -e "[0-9]\{2\}%" | sed "s/\([0-9]\+%\) \(\S\+\)/%{F$ORANGE}\2:%{F-} %{F$RED}\1%{F-}/g" | tr '\n' ' ' )"

	echo "$PERCENTAGE_USAGE"
}

function getDate(){
	echo "$( date "+%l:%m:%S%p %d/%m/%y (%a %b)" )"
}

function getFullBar(){
	LEFT="$(getDropboxStatus) $(getNetwork) $(getVolume)"
	CENTER="$(getDate)"
	RIGHT="$(getPartitionUsage) $(getMemory)"
	echo "$LEFT%{c}$CENTER%{r}$RIGHT"
}

while true ; do
	getFullBar 
	sleep 1
done | lemonbar -p -n "wew" -B $BACKGROUND -F $WHITE -f "Tamzen-8"
