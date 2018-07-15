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

