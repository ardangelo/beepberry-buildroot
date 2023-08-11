#!/bin/sh

next_is_status=0

dbus-monitor --system "type='signal',interface='org.freedesktop.NetworkManager'" \
	| while read -r line; do

	last_word=${line##* }

	if [ "$last_word" = "member=StateChanged" ]; then
		next_is_status=1

	elif [ $next_is_status -eq 1 ]; then
		case $last_word in
		30) . /etc/wlan.d/disconnected;;
		40) . /etc/wlan.d/connecting;;
		70) . /etc/wlan.d/connected;;
		*) ;;
		esac

		next_is_status=0
	fi
done

