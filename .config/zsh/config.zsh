export EDITOR=nvim
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTFILE="$HOME/.zsh_history"

#Autocomplete stuff:
autoload -Uz compinit promptinit
compinit
promptinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

#up/down arrow keys search history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward

