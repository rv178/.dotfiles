#!/bin/sh

picom --config ~/.dwm/picom/picom.conf &
redshift -P -O 4500
dunst &
brightnessctl set 75
nm-applet &

~/.fehbg
~/.dwm/polybar/launch.sh &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

sxhkd -c ~/.dwm/sxhkd/sxhkdrc &

~/.dwm/scripts/updates.sh &
# ~/.dwm/bar/bar.sh &


dwm
