#! /bin/sh

i3status | while :
do
    read line
	music=$(mpc -f "%title% - %artist% - %album% (%time%)" | head -n 1)
    echo "$music| $line" || exit 1
done
