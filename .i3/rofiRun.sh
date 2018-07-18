#!/bin/bash
BACKGROUND="#2c292d"
WHITE="#fdf9f3"
RED="#ff6188"
ORANGE="#fc9867"
YELLOW="#ffd866"
GREEN="#a9dc76"
BLUE="#78dce8"
PURPLE="#ab9df2"

rofi \
-show $1 \
-bg-active $BACKGROUND \
-bgalt $BACKGROUND \
-bg $BACKGROUND \
-bg-urgent $BACKGROUND \
-fg-active $RED \
-fg $BLUE \
-fg-urgent $ORANGE \
-font "pango:Tamzen Regular 10px" \
-hlbg-active $RED \
-hlbg $GREEN \
-hlbg-urgent $ORANGE \
-hlfg-active $BACKGROUND \
-hlfg $BACKGROUND \
-hlfg-urgent $BACKGROUND \
