[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

setxkbmap us
xset +fp ~/.fonts/tamzen/bdf
xset fp rehash
xset -dpms
xset s noblank
xset s off 
source $HOME/.config/zsh/path.zsh
