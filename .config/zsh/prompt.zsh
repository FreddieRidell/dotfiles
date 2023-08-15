setopt promptsubst
autoload -Uz promptinit
autoload -Uz vcs_info

promptinit

function pwd_color {
	HASH="0x$(echo $PWD | md5)"
	HEX=${HASH[1,8]}
	print $(( 1 + HEX % 6))
}

PROMPT='%F{$PROMPT_COLOR}%n@%m%f %F{$(pwd_color)}%~%f
$ %f'

RPROMPT='$(rusty-zsh-prompt --right)'

#TMOUT=1
#TRAPALRM() {
	##echo $WIDGET
	#if [ "$WIDGET" != "fzf-completion" ]; then
		#zle reset-prompt
	#fi
#}

setopt promptsubst
