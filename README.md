# Beepberry Buildroot

	curl https://buildroot.org/downloads/buildroot-2023.02.tar.xz | tar xJ
	mv buildroot-* buildroot
	cd buildroot
	make defconfig BR2_EXTERNAL=../bb_drivers BR2_DEFCONFIG=../br_defconfig
