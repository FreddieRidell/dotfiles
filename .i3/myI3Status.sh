#! /bin/sh

i3status | while :
do
    read line
	music=$(mpc -f "%title% - %artist% - %album% (%time%)" | head -n 1)
	dropbox="dropbox: $(dropbox status | tr '\n' ' ')"
	task="$(task bar | head -4 | tail -1 | sed -e "s/ \+/ - /")"
    echo "$task | $dropbox | $music| $line" || exit 1
done
