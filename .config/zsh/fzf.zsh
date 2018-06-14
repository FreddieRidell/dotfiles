# Setup fzf
# ---------
export PATH="$PATH:$HOME/.fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

# when in git repo improves performance, and limits to checked-in files.
export FZF_DEFAULT_COMMAND='ag -g ""'
