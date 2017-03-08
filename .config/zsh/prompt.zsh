function get_current_hostname(){
	echo "%F{red}%m"
}

function get_current_dir(){
	echo "%F{green}%2~"
}

function get_current_repo(){
	if git rev-parse --git-dir > /dev/null 2>&1; then
		echo "%F{white}(%F{magenta}$(basename `git rev-parse --show-toplevel`)%F{white})"
	else
		echo "()"
	fi
}

function get_left_prompt(){
	echo "$(get_current_hostname) $(get_current_repo) $(get_current_dir) %f> "
}


setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git cvs svn

zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' formats       \
    "%r %b %u %c"

zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '

C=0
# or use pre_cmd, see man zshcontrib
function vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "yes"
	else
		echo "no"
		#echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}

echo "$(get_left_prompt )"

PROMPT=$'$(get_left_prompt)'
RPROMPT=$'$(vcs_info_wrapper)'

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
