#!/usr/bin/env zsh

source ~/.zshrc 

if [ x"$@" = x"quit" ]
then
    exit 0
fi

if [ "$@" ]
then
	RESP=`zsh -c "task $* | sed -e 's/\x1b\[.\{1,5\}m//g'"`

	echo $RESP
else
	RESP=$( task | sed -e "s/\x1b\[.\{1,5\}m//g" )

	echo $RESP
fi
