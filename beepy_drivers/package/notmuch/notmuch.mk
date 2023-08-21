NOTMUCH_VERSION = 0.37
NOTMUCH_SOURCE = notmuch-$(NOTMUCH_VERSION).tar.xz
NOTMUCH_SITE = https://notmuchmail.org/releases

NOTMUCH_DEPENDENCIES = gmime libtalloc libxapian

NOTMUCH_INSTALL_STAGING=yes

NOTMUCH_CONF_ENV = \
	XAPIAN_CONFIG=$(STAGING_DIR)/usr/bin/xapian-config

NOTMUCH_CONF_OPTS = \
	--with-ruby=no \
	--with-emacs=no \
	--with-desktop=no

NOTMUCH_MAKE_OPTS = \
	CPPFLAGS=-I$(STAGING_DIR)/usr/include \
	LDFLAGS=-L$(STAGING_DIR)/usr/lib

define NOTMUCH_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(NOTMUCH_OPTS) \
		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(NOTMUCH_OPTS) \
		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D) install
endef

$(eval $(autotools-package))

