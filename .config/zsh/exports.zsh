export EDITOR=nvim
export SSH_KEY_PATH=~/.ssh/dsa_id
export TERMINAL=urxvt
export SHELL=$(which zsh)
export RUST_BACKTRACE=1
export HYPERTASK_DIR=~/.hypertask
export HYPERTASK_AFTER='git --git-dir=$HOME/cortex/ --work-tree=$HOME add $HYPERTASK_DIR && git --git-dir=$HOME/cortex/ --work-tree=$HOME commit -am "hypertask"'
export FILTER_BRANCH_SQUELCH_WARNING=1.

if ! type "bat" > /dev/null; then
	export CATTER=cat
else 
	export CATTER=bat
fi

case "$HOST" in
	Freddies-Mini)
		export PROMPT_COLOR=1
        ;;
	Freddies-Mac-mini.local)
		export PROMPT_COLOR=1
        ;;
	tasker)
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
