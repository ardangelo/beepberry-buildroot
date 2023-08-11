W3M_VERSION = 0.5.3+git20230121
W3M_SOURCE = w3m_$(W3M_VERSION).orig.tar.xz
W3M_SITE = http://deb.debian.org/debian/pool/main/w/w3m

W3M_DEPENDENCIES = host-libgc host-mktable ncurses libatomic_ops libgc

W3M_CONF_ENV = \
	ac_cv_func_setpgrp_void=yes

W3M_CONF_OPTS = \
	--disable-mouse

define W3M_BUILD_CMDS
	cp $(HOST_DIR)/usr/bin/mktable $(@D)/mktable-host
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
	rm $(@D)/mktable-host
endef

$(eval $(autotools-package))
