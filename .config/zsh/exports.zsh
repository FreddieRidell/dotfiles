export EDITOR=nvim
export SSH_KEY_PATH=~/.ssh/dsa_id
export TERMINAL=urxvt
export SHELL=$(which zsh)
export RUST_BACKTRACE=1
export HYPERTASK_DIR=~/.hypertask
export HYPERTASK_AFTER='git --git-dir=$HOME/cortex/ --work-tree=$HOME add $HYPERTASK_DIR && git --git-dir=$HOME/cortex/ --work-tree=$HOME commit -am "hypertask"'
export FILTER_BRANCH_SQUELCH_WARNING=1.

#Android Studio Path
export ANDROID_HOME="/home/freddie/Android/"
export JAVA_HOME="~/Binaries/android-studio/jre"

if ! type "bat" > /dev/null; then
	export CATTER=cat
else 
	export CATTER=bat
fi

case "$HOST" in
    tower)
		export PROMPT_COLOR=1
        ;;
	freddie-server)
		export PROMPT_COLOR=2
		;;
	freddie-ThinkPad-X220)
		export PROMPT_COLOR=4
		;;
	remote-work-station)
		export PROMPT_COLOR=5
		;;
    *)
        echo "Need to set PROMPT_COLOR for host $HOST"
        ;;
esac
