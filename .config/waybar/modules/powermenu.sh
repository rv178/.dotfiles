rofiopt="Shut down\nReboot\nLock"
rofi=$(printf "$rofiopt" | rofi -dmenu -i -p "Powermenu")
[ -z "$rofi" ] && exit

case $rofi in
	"Shut down") shutdown now;;
	"Reboot") reboot;;
	"Lock") swaylock;;
	*)
esac
