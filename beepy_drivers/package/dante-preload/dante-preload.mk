################################################################################
#
# dante-preload
#
################################################################################

DANTE_PRELOAD_VERSION = 1.4.3
DANTE_PRELOAD_SOURCE = dante-$(DANTE_PRELOAD_VERSION).tar.gz
DANTE_PRELOAD_SITE = http://www.inet.no/dante/files
DANTE_PRELOAD_LICENSE = BSD-3-Clause
DANTE_PRELOAD_LICENSE_FILES = LICENSE
DANTE_PRELOAD_SELINUX_MODULES = dante

# Needed so that our libtool patch applies properly
DANTE_PRELOAD_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
DANTE_PRELOAD_DEPENDENCIES += libminiupnpc
DANTE_PRELOAD_CONF_OPTS += --with-upnp
else
DANTE_PRELOAD_CONF_OPTS += --without-upnp
endif

ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
DANTE_PRELOAD_DEPENDENCIES += linux-pam
DANTE_PRELOAD_CONF_OPTS += --with-pam
else
DANTE_PRELOAD_CONF_OPTS += --without-pam
endif

define DANTE_PRELOAD_INSTALL_CONFIG_FILE
	$(INSTALL) -D -m 644 $(@D)/example/sockd.conf \
		$(TARGET_DIR)/etc/sockd.conf
endef

DANTE_PRELOAD_POST_INSTALL_TARGET_HOOKS += DANTE_PRELOAD_INSTALL_CONFIG_FILE

define DANTE_PRELOAD_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/dante/dante.service \
		$(TARGET_DIR)/usr/lib/systemd/system/dante.service
endef

define DANTE_PRELOAD_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/dante/S50dante \
		$(TARGET_DIR)/etc/init.d/S50dante
endef

$(eval $(autotools-package))
