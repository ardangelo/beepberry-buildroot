#!/bin/sh

set -u
set -e

# Add an autologin console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:-/bin/sh' ${TARGET_DIR}/etc/inittab
fi

# Move nonessential init scripts to background
TARGET_INIT_D=${TARGET_DIR}/etc/init.d
SCRIPTS=$(find ${TARGET_INIT_D} -type f -regex "${TARGET_INIT_D}/S[1-9].*")
mkdir -p ${TARGET_INIT_D}/background
for script in $SCRIPTS; do
	mv $script ${TARGET_INIT_D}/background/
done

