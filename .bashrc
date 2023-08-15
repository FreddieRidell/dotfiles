# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ "$TERM" == *rxvt* ]]; then
   exec zsh
fi

alias config='/usr/bin/git --git-dir=/home/fedora/dotfiles/ --work-tree=/home/fedora'
alias jest="jest --maxWorkers=y0%"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/serverless.bash ] && . /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/sls.bash ] && . /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/sls.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
