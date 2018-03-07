setopt promptsubst
autoload -Uz promptinit
promptinit

#Left Prompt
function get_current_hostname(){
	echo "%{%F{red}%}%m"
}

function get_current_dir(){
	echo "%{%F{green}%}%~"
}

function get_current_repo(){
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo "%{%F{white}%}(%{%F{magenta}%}$(basename `git rev-parse --show-toplevel`)%{%f%})"
	else
		echo ""
	fi
}

function get_left_prompt(){
	echo "$(get_current_hostname) $(get_current_repo) $(get_current_dir)\n%f$ "
}


#Right Prompt
function get_git_branch(){
	echo "%F{magenta}$(git rev-parse --abbrev-ref HEAD)"
}

REMOVE_WHITESPACE='s/[ \t]*//g'
function get_git_count(){
	CHECKED="$(git status --porcelain 2>/dev/null| grep "^$1" | wc -l | sed -e $REMOVE_WHITESPACE )"
	UNCHECKED="$(git status --porcelain 2>/dev/null| grep "^$2" | wc -l | sed -e $REMOVE_WHITESPACE )"

	if [ $CHECKED = "0" ] && [ $UNCHECKED = "0" ] ; then
		echo ""
	else
		echo "%{%F{$3}%}$UNCHECKED%{%f%}/%{%F{$3}%}$CHECKED %{%f%}| " 
	fi
}

function get_git_diff_origin_num(){
	BRANCH="$(git rev-parse --abbrev-ref HEAD)"

	if [ $BRANCH != "HEAD" ]; then
		NUM_AHEAD="$(git rev-list --left-right --count $BRANCH...origin/$BRANCH 2> /dev/null | grep -Eo '^[0-9]+' )"
		NUM_BEHIND="$(git rev-list --left-right --count $BRANCH...origin/$BRANCH 2> /dev/null | grep -Eo '^[0-9]+$' )"

		if [ "$NUM_AHEAD" != "0" ] || [ "$NUM_BEHIND" != "0" ] ; then
			echo "%F{cyan}$NUM_AHEAD%f/%F{cyan}$NUM_BEHIND %f| " 
		else
			echo ""
		fi
	else
		echo ""
	fi
}

function get_git_stashes(){
	STASHCOUNT="$(git stash list | ag "$( gitCurrentBranch )" -c)"

	echo "%F{red}$STASHCOUNT"
}
function get_right_prompt(){
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo "%f[ $(get_git_stashes) $(get_git_count 'A' '??' 'green')$(get_git_count 'M' ' M' 'yellow')$(get_git_count 'D' ' D' 'red')$(get_git_diff_origin_num)$(get_git_branch)%f ]"
	else
		echo "[]"
	fi
}

PROMPT='$(get_left_prompt)'
RPROMPT='$(get_right_prompt)'

setopt promptsubst

