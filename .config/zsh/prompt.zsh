GIT_BRANCH=$(git symbolic-ref --short HEAD)

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

echo git_prompt_info

PROMPT="%F{red}%m %F{green}%2~ %f> "
RPROMPT="[$(git_prompt_info)]"

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
