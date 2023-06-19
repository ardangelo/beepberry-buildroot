SHARP_DRM_VERSION = 1.0
SHARP_DRM_SITE = $(BR2_EXTERNAL_BB_DRIVERS_PATH)/package/sharp_drm
SHARP_DRM_SITE_METHOD = local

SHARP_DRM_INSTALL_IMAGES = YES
SHARP_DRM_MODULE_SUBDIRS = .

define SHARP_DRM_BUILD_CMDS
	for dts in $(@D)/*.dts; do \
		$(HOST_DIR)/bin/dtc -@ -I dts -O dtb -W no-unit_address_vs_reg -o $${dts%.dts}.dtbo $${dts}; \
	done
endef

define SHARP_DRM_INSTALL_IMAGES_CMDS
	for dtbo in $(@D)/*.dtbo; do \
		$(INSTALL) -D -m 0644 $${dtbo} $(BINARIES_DIR)/rpi-firmware/overlays; \
	done
endef

$(eval $(kernel-module))
$(eval $(generic-package))
