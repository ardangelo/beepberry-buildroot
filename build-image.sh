#!/bin/sh

set -e

# Download Buildroot
if [ ! -d buildroot ]; then
curl https://buildroot.org/downloads/buildroot-2024.02.tar.xz | tar xJ
mv buildroot-* buildroot
fi

# `make linux-savedefconfig` to save defconfig
# it's stored in buildroot/output/build/linux-custom/defconfig

cd buildroot
make -j $(nproc) defconfig BR2_EXTERNAL=../beepy_drivers BR2_DEFCONFIG=../br_defconfig
make -j $(nproc)
echo "Image built at buildroot/output/images/sdcard.img"

# After changing a br_defconfig option for a package, run `make <pkg>-dirclean>, then rebuild

# rm -rf output/target
# find output/ -name ".stamp_target_installed" -delete
# rm -f output/build/host-gcc-final-*/.stamp_host_installed
