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


export PATH="$HOME/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.task.zsh ] && source ~/.task.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

case $( uname ) in
	Darwin)
		source $HOME/.config/zsh/config.darwin.zsh
		;;
	Linux)
		source $HOME/.config/zsh/config.linux.zsh
		;;
esac
