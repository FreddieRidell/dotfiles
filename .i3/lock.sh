#!/bin/bash

IMG_NAME="/tmp/$RANDOM.png" 
scrot $IMG_NAME
convert -resize 12.5% -scale 800% $IMG_NAME $IMG_NAME
i3lock -i $IMG_NAME
rm $IMG_NAME
