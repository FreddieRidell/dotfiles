# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias config='/usr/bin/git --git-dir=/home/fedora/dotfiles/ --work-tree=/home/fedora'


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/serverless.bash ] && . /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/sls.bash ] && . /home/freddie/Documents/Serverless/graphcool-user-creator/node_modules/tabtab/.completions/sls.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
