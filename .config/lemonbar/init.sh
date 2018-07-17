#!/bin/bash

BACKGROUND="#2c292d"
WHITE="#fdf9f3"
RED="#ff6188"
ORANGE="#fc9867"
YELLOW="#ffd866"
GREEN="#a9dc76"
BLUE="#78dce8"
PURPLE="#ab9df2"

I="0"

VOLUME_REFRESH="1"
DROPBOX_REFRESH="5"
LOAD_REFRESH="7"
BATTERY_REFRESH="13"
MEMORY_REFRESH="17"
NETWORK_REFRESH="23"
PARTITION_REFRESH="29"

# not incorporating this yet, 'cause I need to re-write the bar in wren, but usefull:
# curl https://api.cryptonator.com/api/ticker/btc-eth

function getDropboxStatus(){
	if [ "$(( $I % $DROPBOX_REFRESH ))" = "0" ] ; then
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
	if [ "$(( $I % $MEMORY_REFRESH ))" = "0" ] ; then
		MEM="$( free -h | head -2 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/\3\/\2/g")"
		SWAP="$( free -h | head -3 | tail -1 | sed -e "s/\(\S\+\)\s\+\(\S\+\)\s\+\(\S\+\).*/\3\/\2/g")"

		OUTPUT="%{F$BLUE}$MEM %{F$PURPLE}$SWAP%{F-}"
		echo $OUTPUT > /tmp/getMemory.lemon
		echo $OUTPUT
	else
		cat /tmp/getMemory.lemon
	fi
}

function getVolume(){
	if [ "$(( $I % $VOLUME_REFRESH ))" = "0" ] ; then
		DATA="$(amixer sget Master)"
		LOUDEST_VOLUME="$( echo "$DATA" | awk -F"[][]" '/Playback/ { print $2 }' | sort | uniq | head -2 | tail -1 )"
		MUTED="$( echo "$DATA" | awk -F"[][]" '/Playback/ { print $4 }' | sort | uniq | head -2 | tail -1 )"
		NUMBER="$( echo "$LOUDEST_VOLUME" | sed -e "s/\([0-9]*\).*/\1/g" )"

		COLOR=""
		if [ "$NUMBER" -lt "70" ] ; then
			COLOR="$GREEN"
		elif [ "$NUMBER" -lt "80" ] ; then
			COLOR="$YELLOW"
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
	if [ "$(( $I % $NETWORK_REFRESH ))" = "0" ] ; then
		SSID="$( iwconfig wlo1 | grep "ESSID:\".*\"" -oh | sed 's/ESSID:"\(.*\)"/\1/' )"
		WIFI_IP="$( ifconfig wlo1 | head -2 | tail -1 | sed "s/.*inet \(\S\+\).*/\1/g" )"
		WIFI_STRENGTH="$( iwconfig wlo1 | head -6 | tail -1 | sed -e "s/.*=\([0-9]\+\/[0-9]\+\).*/\1*100/g" | bc -l | sed -e "s/\.[0-9]*//g" )"
		WIFI_SPEED="$( iwconfig wlo1 | head -3 | tail -1 | sed -e "s/\s*Bit Rate=\([0-9\.]\+\s\S\+\).*/\1/g" )"

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
	if [ "$(( $I % $PARTITION_REFRESH ))" = "0" ] ; then
		PERCENTAGE_USAGE="$( df | tail --lines=+2 | sed -e "s/\(\S\+\s\+\)\{4\}//" | grep -e "[0-9]\{2\}%" | sed "s/\([0-9]\+%\) \(\S\+\)/%{F$ORANGE}\2:%{F-} %{F$RED}\1%{F-}/g" | tr '\n' ' ' )"

		OUTPUT="$PERCENTAGE_USAGE"
		echo $OUTPUT > /tmp/getPartitionUsage.lemon
		echo $OUTPUT
	else
		cat /tmp/getPartitionUsage.lemon
	fi
}

function getDate(){
	echo "$( date -u "+%Y-%m-%dT%H:%M:%SZ" )"
}

#echo "$( date "+%l:%m:%S%p %d/%m/%y (%a %b)" )"

function getBattery(){
	if [ "$(( $I % $BATTERY_REFRESH))" = "0" ] ; then
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

		OUTPUT="$COLOR$STATE $PERCENTAGE% $TIME_TO%{F-}"
		echo $OUTPUT > /tmp/getBattery.lemon
		echo $OUTPUT
	else
		cat /tmp/getBattery.lemon
	fi
}

PROCESSORS_N="$(grep processor /proc/cpuinfo | wc -l)"
function getLoad(){
	if [ "$(( $I % $LOAD_REFRESH ))" = "0" ] ; then
		AVERAGE_LOAD="$( uptime | sed -e "s/.*load average: \([0-9\.]\+\).*/\1/" )"
		PERCENTAGE_LOAD="$( echo "($AVERAGE_LOAD/$PROCESSORS_N)*100" | bc -l | sed -e "s/\([0-9]\+\).*/\1/" )"

		COLOR=""
		if [ "$PERCENTAGE_LOAD" -lt "30" ] ; then
			COLOR="%{F$GREEN}"
		elif [ "$PERCENTAGE_LOAD" -lt "50" ] ; then
			COLOR="%{F$YELLOW}"
		elif [ "$PERCENTAGE_LOAD" -lt "70" ] ; then
			COLOR="%{F$ORANGE}"
		else
			COLOR="%{F$RED}"
		fi


		OUTPUT="Load: $COLOR$PERCENTAGE_LOAD%%{F-}"
		echo $OUTPUT > /tmp/getLoad.lemon
		echo $OUTPUT
	else
		cat /tmp/getLoad.lemon
	fi
}

function getFullBar(){
	LEFT="$(getDropboxStatus) $(getNetwork) $(getVolume)"
	CENTER="$(getDate)"
	RIGHT="$(getBattery) $(getMemory) $(getPartitionUsage) $(getLoad)"
	echo " $LEFT%{c}$CENTER%{r}$RIGHT "
}

while true ; do
	time getFullBar 
	I=$(( $I + 1 ))
	sleep 2
done | lemonbar -p -n "wew" -B $BACKGROUND -F $WHITE -f "Tamzen-7" | /bin/bash
