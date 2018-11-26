[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source $HOME/.config/zsh/exports.zsh
source $HOME/.config/zsh/path.zsh
source $HOME/.config/zsh/config.zsh
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/functions/itterators.zsh
source $HOME/.config/zsh/functions/shortcuts.zsh
source $HOME/.config/zsh/functions/pass.zsh
source $HOME/.config/zsh/prompt.zsh
source $HOME/.config/zsh/keybinding.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/env.zsh

export PATH="$HOME/.yarn/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/mcclowes/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/mcclowes/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/mcclowes/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/mcclowes/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
