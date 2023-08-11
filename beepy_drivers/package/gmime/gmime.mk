GMIME_VERSION = 3.2.13
GMIME_SOURCE = $(GMIME_VERSION).tar.gz
GMIME_SITE = https://github.com/jstedfast/gmime/archive/refs/tags
GMIME_AUTORECONF = YES

GMIME_INSTALL_STAGING=yes

GMIME_CONF_ENV = \
	ac_cv_have_iconv_detect_h=no

define GMIME_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(GMIME_OPTS) \
		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install

	# GMIME_INSTALL_STAGING isn't working properly
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(GMIME_OPTS) \
		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D) install
endef

$(eval $(autotools-package))

