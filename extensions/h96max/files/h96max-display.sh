#!/bin/sh
# Show HH:MM and link icons on the FD6551 front-panel display.
LED=/sys/class/leds/display
i=0
while [ ! -d "$LED" ] && [ "$i" -lt 30 ]; do
	sleep 1
	i=$((i + 1))
done
[ -d "$LED" ] || exit 1

echo 3 > "$LED/brightness"
icon() { echo "$2" > "/sys/class/leds/display::$1/brightness"; }
state() { [ "$(cat "$1" 2> /dev/null)" = "up" ] && echo 1 || echo 0; }

for n in alarm play pause; do icon "$n" 0; done

tick=0
while :; do
	date +%H%M > "$LED/message"
	icon colon $((tick % 2))
	if [ $((tick % 5)) -eq 0 ]; then
		icon wlan "$(state /sys/class/net/wlan0/operstate)"
		icon lan "$(state /sys/class/net/end0/operstate)"
		if ls /sys/bus/usb/devices/*/product > /dev/null 2>&1; then icon usb 1; else icon usb 0; fi
	fi
	tick=$((tick + 1))
	sleep 1
done
