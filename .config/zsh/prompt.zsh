setopt promptsubst
autoload -Uz promptinit
autoload -Uz vcs_info

promptinit

function current_started_task {
	TASKS="$(task +ACTIVE export)"
	LENGTH="$(echo $TASKS | jq 'length')"
	if [ $LENGTH -ne "0" ] ; then
		echo $TASKS | jq -r  '
		.[0] | [
			"[%F{2}\(.id)%f]",

			if select(.project) then
				"%F{5}\( .project? )%f"
			else null end,

			if select(.tags) then
				"%F{3}\( .tags | map( "+\(.)") | join(" ") )%f"
			else null end,

			"%F{4}\( .description )%f"

		] |  map(select(.)) | map( "\(.)" ) | join(" ")'
	else 
		echo "%K{1}%F{8} NO ACTIVE TASK %f%k"
	fi
}

function pwd_color {
	HASH="0x$(echo $PWD | md5)"
	HEX=${HASH[1,8]}
	print $(( 1 + HEX % 6))
}

PROMPT='%F{$PROMPT_COLOR}%n@%m%f %F{7}%D{%a %Y-%m-%d %T}%f %F{$(pwd_color)}%~%f %F{7}$(current_started_task)
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
