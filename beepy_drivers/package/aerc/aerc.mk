AERC_VERSION = 0.5.2
AERC_SOURCE = $(AERC_VERSION).tar.gz
AERC_SITE = https://git.sr.ht/~rjarry/aerc/archive

AERC_DEPENDENCIES = host-go notmuch

define AERC_BUILD_CMDS
	GOOS=linux GOARCH=arm GOFLAGS="-tags=notmuch -buildvcs=false" CGO_ENABLED=1 \
		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define AERC_INSTALL_TARGET_CMDS

	# aerc expects default in /usr/local
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(NOTMUCH_OPTS) \
        DESTDIR=$(TARGET_DIR) PREFIX=/usr/local -C $(@D) install
	mv $(TARGET_DIR)/usr/local/bin/aerc $(TARGET_DIR)/usr/bin/

	# Enable HTML filter
	sed -i 's|#text/html=/usr/local/share/aerc/filters/html|text/html=/usr/local/share/aerc/filters/html|g' $(TARGET_DIR)/usr/local/share/aerc/aerc.conf

endef

$(eval $(generic-package))
