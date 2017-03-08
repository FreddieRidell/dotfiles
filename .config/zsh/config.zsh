export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/dsa_id"


#Autocomplete stuff:
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
