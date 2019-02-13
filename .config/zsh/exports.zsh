export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/dsa_id"
export TERMINAL=urxvt
export SHELL=$(which zsh)

#Android Studio Path
export ANDROID_HOME="/home/freddie/Android/"
export JAVA_HOME="~/Binaries/android-studio/jre"

if ! type "bat" > /dev/null; then
	export CATTER=cat
else 
	export CATTER=bat
fi

case "$HOST" in
    moblies-Mac-mini.local)
		export PROMPT_COLOR=1
        ;;
    *)
        echo "Need to set $PROMPT color for host $HOST"
        ;;
esac
