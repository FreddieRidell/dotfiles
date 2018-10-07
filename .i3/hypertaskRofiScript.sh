#!/usr/bin/env bash

if [ x"$@" = x"quit" ]
then
    exit 0
fi

if [ "$@" ]
then
	RESP=`task $*`


	while read -r line; do
		echo -e "$line"
	done <<< "$RESP"
else
	RESP=`task`

	while read -r line; do
		echo -e "$line"
	done <<< "$RESP"
fi
