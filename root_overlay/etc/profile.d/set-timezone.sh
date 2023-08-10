#!/bin/sh
#
# Update timezone setting
#

umask 077

if [ -f /boot/timezone.txt ]; then
	export TZ=$(cat /boot/timezone.txt)
fi
