[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/exports.zsh
source $HOME/.config/zsh/functions/cortex.zsh
source $HOME/.config/zsh/functions/secret.zsh
source $HOME/.config/zsh/functions/itterators.zsh
source $HOME/.config/zsh/functions/oneliners.zsh
source $HOME/.config/zsh/functions/pass.zsh
source $HOME/.config/zsh/functions/shortcuts.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/keybinding.zsh
source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/prompt.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.task.zsh ] && source ~/.task.zsh


case $( uname ) in
	Darwin)
		source $HOME/.config/zsh/config.darwin.zsh
		;;
	Linux)
		source $HOME/.config/zsh/config.linux.zsh
		;;
esac

zstyle ':completion:*:*:task:*' verbose yes
zstyle ':completion:*:*:task:*:descriptions' format '%U%B%d%b%u'

zstyle ':completion:*:*:task:*' group-name ''

compdef task _task


eval "$(zoxide init zsh --cmd cd)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
