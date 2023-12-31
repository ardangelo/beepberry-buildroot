#!/bin/sh

set -u
set -e

# Add an autologin console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:-/bin/login -f beepy' ${TARGET_DIR}/etc/inittab
fi

# Add user to sudoers
if [ -e ${TARGET_DIR}/etc/sudoers ]; then
	if ! grep -qE '^beepy ALL' ${TARGET_DIR}/etc/sudoers; then
		chmod 700 ${TARGET_DIR}/etc/sudoers
		echo "beepy ALL=(ALL) NOPASSWD: ALL" >> ${TARGET_DIR}/etc/sudoers
		chmod 440 ${TARGET_DIR}/etc/sudoers
	fi
fi

# Move nonessential init scripts to background
TARGET_INIT_D=${TARGET_DIR}/etc/init.d
SCRIPTS=$(find ${TARGET_INIT_D} -type f -regex "${TARGET_INIT_D}/S[1-9].*")
mkdir -p ${TARGET_INIT_D}/background
for script in $SCRIPTS; do
	mv $script ${TARGET_INIT_D}/background/
done

# Add AP config line to iwd init script
if [ -e ${TARGET_DIR}/etc/init.d/background/S40iwd ]; then
	grep -qE '^mkdir -p /var/lib/iwd' ${TARGET_DIR}/etc/init.d/background/S40iwd || \
		sed -i '/printf "Starting iwd:"/a\
mkdir -p /var/lib/iwd; cp /boot/wlan/*.psk /var/lib/iwd/ 2>/dev/null || :' \
			${TARGET_DIR}/etc/init.d/background/S40iwd
fi


# Create mount points and update fstab
mkdir -p ${TARGET_DIR}/boot
grep -qE "^/dev/mmcblk0p1  /boot" ${TARGET_DIR}/etc/fstab \
	|| echo "/dev/mmcblk0p1  /boot           vfat    defaults,noatime" \
		>> ${TARGET_DIR}/etc/fstab
mkdir -p ${TARGET_DIR}/home
