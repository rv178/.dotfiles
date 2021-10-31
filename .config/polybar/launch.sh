#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c ~/.config/polybar/bar1 -rq bar &
polybar -c ~/.config/polybar/bar2 -rq bar &
polybar -c ~/.config/polybar/bar3 -rq bar &

echo "Bars launched..."
