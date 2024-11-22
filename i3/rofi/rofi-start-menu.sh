#!/bin/sh 
# export XDG_DATA_HOME=$USER/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share

case $1 in 
  power)
    exec ~/.config/rofi/rofi-power-menu.sh
    ;;
  *)
    rofi -show $1 -theme-str "window {width: 16em;} listview {lines: 6;}"
    ;;
esac
