setopt promptsubst
autoload -Uz promptinit
autoload -Uz vcs_info

promptinit

PROMPT="%F{$PROMPT_COLOR}%n@%m%f %F{7}%D{%a %Y-%m-%d %T}%f %F{2}%~%f %F{7}
$ %f"

RPROMPT='$(rusty-zsh-prompt --right)'

#TMOUT=1
#TRAPALRM() {
	##echo $WIDGET
	#if [ "$WIDGET" != "fzf-completion" ]; then
		#zle reset-prompt
	#fi
#}

setopt promptsubst
