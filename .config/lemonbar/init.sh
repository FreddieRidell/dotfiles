#!/bin/bash

BACKGROUND="#272822"
WHITE="#eeeeee"
RED="#f92672"
ORANGE="#fd971f"
YELLOW="#e6db74"
GREEN="#a6e22e"
BLUE="#66d9ef"
PURPLE="#ae81ff"

I="0"

function getDropboxStatus(){
	if [ "$(( $I % 5 ))" = "0" ] ; then
		STATUS="$( dropbox status | head -1 )"

		if [ "$STATUS" = "Dropbox isn't running!" ] ; then
			OUTPUT="%{F$PURPLE}%{A:dropbox start:}$STATUS%{A}%{F-}"
		else
			OUTPUT="%{F$BLUE}%{A:dropbox stop:}$STATUS%{A}%{F-}"
		fi

		echo $OUTPUT > /tmp/getDropboxStatus.lemon
		echo $OUTPUT
	else
		cat /tmp/getDropboxStatus.lemon
	fi
}

function getMemory(){
	MEM="$( free -h | head -2 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/\3\/\2/g")"
	SWAP="$( free -h | head -3 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/\3\/\2/g")"
	echo "%{F$BLUE}$MEM %{F$PURPLE}$SWAP%{F-}"
}

function getVolume(){
	if [ "$(( $I % 3 ))" = "0" ] ; then
		LOUDEST_VOLUME="$( awk -F"[][]" '/Playback/ { print $2 }' <(amixer sget Master) | sort | uniq | head -2 | tail -1 )"
		MUTED="$( awk -F"[][]" '/Playback/ { print $4 }' <(amixer sget Master) | sort | uniq | head -2 | tail -1 )"
		NUMBER="$( echo "$LOUDEST_VOLUME" | sed -e "s/\([0-9]*\).*/\1/g" )"

		COLOR=""
		if [ "$NUMBER" -lt "70" ] ; then
			COLOR="F$GREEN"
		elif [ "$NUMBER" -lt "80" ] ; then
			COLOR="F$YELLOW"
		elif [ "$NUMBER" -lt "90" ] ; then
			COLOR="$ORANGE"
		else
			COLOR="$RED"
		fi

		INVERT="F"
		if [ "$MUTED" = "off" ]; then
			INVERT="B"
		fi

		OUTPUT="%{$INVERT$COLOR}Vol: $LOUDEST_VOLUME %{$INVERT-}"
		echo $OUTPUT > /tmp/getVolume.lemon
		echo $OUTPUT
	else
		cat /tmp/getVolume.lemon
	fi
}

function getNetwork(){
	if [ "$(( $I % 7 ))" = "0" ] ; then
		SSID="$( iwconfig wlo1 | grep "ESSID:\".*\"" -oh | sed 's/ESSID:"\(.*\)"/\1/' )"
		WIFI_IP="$( ifconfig wlo1 | head -2 | tail -1 | sed "s/.*inet \(\S\+\).*/\1/g" )"
		WIFI_STRENGTH="$( iwconfig wlo1 | head -6 | tail -1 | sed -e "s/.*=\([0-9]\+\/[0-9]\+\).*/\1*100/g" | bc -l | sed -e "s/\.[0-9]*//g" )"
		WIFI_SPEED="$( iwconfig wlo1 | head -3 | tail -1 | sed -e "s/\s\+Bit Rate=\([0-9]\+\s\S\+\).*/\1/g" )"

		color="%{F-}"
		if [ "$WIFI_STRENGTH" -gt "50" ] ; then
			COLOR="%{F$GREEN}"
		elif [ "$WIFI_STRENGTH" -gt "30" ] ; then
			COLOR="%{F$YELLOW}"
		elif [ "$WIFI_STRENGTH" -gt "20" ] ; then
			COLOR="%{F$ORANGE}"
		else
			COLOR="%{F$RED}"
		fi

		OUTPUT="$COLOR%{A:gnome-terminal -e ~/.config/lemonbar/launchWifiManager.sh:} $SSID: $WIFI_IP $WIFI_SPEED ($WIFI_STRENGTH%)%{A}%{F-}"
		echo $OUTPUT > /tmp/getNetwork.lemon
		echo $OUTPUT
	else
		cat /tmp/getNetwork.lemon
	fi
}

function getPartitionUsage(){
	PERCENTAGE_USAGE="$( df | tail --lines=+2 | sed -e "s/\(\S\+\s\+\)\{4\}//" | grep -e "[0-9]\{2\}%" | sed "s/\([0-9]\+%\) \(\S\+\)/%{F$ORANGE}\2:%{F-} %{F$RED}\1%{F-}/g" | tr '\n' ' ' )"

	echo "$PERCENTAGE_USAGE"
}

function getDate(){
	echo "$( date "+%l:%m:%S%p %d/%m/%y (%a %b)" )"
}

function getBattery(){
	STATE="$( upower -d | grep "state" | head -1 | sed -e "s/\s\+state:\s\+\(\w\+\)/\1/g" )"
	TIME_TO="$( upower -d | grep "time to" | head -1 | sed -e "s/\s\+time to \S\+\s\+\(\w\+\)/\1/g" )"
	PERCENTAGE="$( upower -d | grep "percentage" | head -1 | sed -e "s/\s\+percentage:\s\+\([0-9]\+\).*/\1/g" )"

	color="%{F-}"
	if [ "$PERCENTAGE" -gt "50" ] ; then
		COLOR="%{F$GREEN}"
	elif [ "$PERCENTAGE" -gt "30" ] ; then
		COLOR="%{F$YELLOW}"
	elif [ "$PERCENTAGE" -gt "20" ] ; then
		COLOR="%{F$ORANGE}"
	else
		COLOR="%{F$RED}"
	fi

	echo "$COLOR$STATE $PERCENTAGE% $TIME_TO%{F-}"
}

function getFullBar(){
	time LEFT="$(getDropboxStatus) $(getNetwork) $(getVolume)"
	CENTER="$(getDate)"
	RIGHT="$(getBattery) $(getPartitionUsage) $(getMemory)"
	echo " $LEFT%{c}$CENTER%{r}$RIGHT "
}

while true ; do
	getFullBar 
	I=$(( $I + 1 ))
	sleep 1
done | lemonbar -p -n "wew" -B $BACKGROUND -F $WHITE -f "Tamzen-7" | /bin/bash
