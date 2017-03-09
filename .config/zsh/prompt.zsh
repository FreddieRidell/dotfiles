#Left Prompt
function get_current_hostname(){
	echo "%F{red}%m"
}

function get_current_dir(){
	echo "%F{green}%3~"
}

function get_current_repo(){
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo "%F{white}(%F{magenta}$(basename `git rev-parse --show-toplevel`)%F{white})"
	else
		echo ""
	fi
}

function get_left_prompt(){
	echo "$(get_current_hostname) $(get_current_repo) $(get_current_dir) \n%f$ "
}

PROMPT=$'$(get_left_prompt)'

#Right Prompt
function get_git_branch(){
	echo "%F{magenta}$(git rev-parse --abbrev-ref HEAD)"
}

function get_git_untracked_num() {
	NUM_OF_UNTRACKED="$(git status --porcelain 2>/dev/null| grep "^??" | wc -l)"

	if [ $NUM_OF_UNTRACKED = "0" ] ; then
		echo ""
	else
		echo "%F{red}$NUM_OF_UNTRACKED %f| " 
	fi
}

function get_git_modified_num(){
	NUM_OF_MODIFIED="$(git status --porcelain 2>/dev/null| grep "^M" | wc -l)"

	if [ $NUM_OF_MODIFIED = "0" ] ; then
		echo ""
	else
		echo "%F{yellow}$NUM_OF_MODIFIED %f| " 
	fi
}

function get_git_added_num(){
	NUM_OF_ADDED="$(git status --porcelain 2>/dev/null| grep "^A" | wc -l)"

	if [ $NUM_OF_ADDED = "0" ] ; then
		echo ""
	else
		echo "%F{green}$NUM_OF_ADDED %f| " 
	fi
}

function get_git_diff_origin_num(){
	BRANCH="$(git rev-parse --abbrev-ref HEAD)"
	REGEX_AHEAD="s/\\s\\+\\S\\+//"
	REGEX_BEHIND="s/\\S\\+\\s\\+//"
	NUM_AHEAD="$(git rev-list --left-right --count $BRANCH...origin/$BRANCH | sed -e $REGEX_AHEAD)"
	NUM_BEHIND="$(git rev-list --left-right --count $BRANCH...origin/$BRANCH | sed -e $REGEX_BEHIND)"

	if [ $NUM_AHEAD != "0" ] || [ $NUM_BEHIND != "0" ] ; then
		echo "%F{cyan}$NUM_AHEAD%f/%F{cyan}$NUM_BEHIND %f| " 
	else
		echo ""
	fi
}

function get_right_prompt(){
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo "%f[ $(get_git_added_num)$(get_git_modified_num)$(get_git_untracked_num)$(get_git_diff_origin_num)$(get_git_branch)%f ]"
	else
		echo "[]"
	fi
}

RPROMPT=$'$(get_right_prompt)'

#RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

#ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"
