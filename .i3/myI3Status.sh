#! /bin/sh

i3status | while :
do
    read line
	music=$(mpc -f "%title% - %artist% - %album% (%time%)" | head -n 1)
	dropbox="dropbox: $(dropbox status | tr '\n' ' ')"

	taskExport="$( task +OVERDUE or +ACTIVE export )"
	taskN="$( echo "$taskExport" | jq "length" )"
	taskI="$(( RANDOM % $taskN ))"

	taskDescription="$( echo "$taskExport" | jq ".[$taskI].description" | sed -e 's/^"//' -e 's/"$//')"
	taskProject="$( echo "$taskExport" | jq ".[$taskI].project" | sed -e 's/^"//' -e 's/"$//')"
	taskUrgency="$( echo "$taskExport" | jq ".[$taskI].urgency" | sed -e 's/^"//' -e 's/"$//')"
	taskId="$( echo "$taskExport" | jq ".[$taskI].id" | sed -e 's/^"//' -e 's/"$//')"

	task="($taskId) $taskProject: $taskDescription ($taskUrgency)"
    echo "$task | $dropbox | $music| $line" || exit 1
done
