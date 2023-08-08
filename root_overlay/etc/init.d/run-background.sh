#!/bin/sh
#
# background Run nonessential init scripts in background
#

umask 077

for script in /etc/init.d/background/S*; do
	/bin/sh $script $1
	script_rc=$?
	if [ $script_rc -ne 0 ]; then
		echo "$script failed with code $script_rc"
	fi
done

exit 0

