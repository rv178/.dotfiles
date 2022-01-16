#!/bin/bash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=20

cpu() {
	cpu_val=$(top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print 100-$8}')

	printf "   $cpu_val"
}


battery() {
	get_capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

	printf "ﮣ  $get_capacity"
}

brightness() {
	brightness="$(cat /sys/class/backlight/amdgpu_bl0/brightness)"
	printf "   $brightness"
}

clock() {
	printf "   $(date '+%I:%M %p') "
}

while true; do

	[ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
	interval=$((interval + 1))

	sleep 1 && xsetroot -name " $(battery) $(brightness) $(cpu) $(clock)"
done
