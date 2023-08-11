MKTABLE_VERSION = 0.5.3+git20230121
MKTABLE_SOURCE = w3m_$(W3M_VERSION).orig.tar.xz
MKTABLE_SITE = http://deb.debian.org/debian/pool/main/w/w3m

HOST_MKTABLE_DEPENDENCIES = host-libgc host-libatomic_ops

MKTABLE_CONF_ENV = \
	ac_cv_func_setpgrp_void=yes

define HOST_MKTABLE_BUILD_CMDS
    $(HOST_MAKE_ENV) $(MAKE) -C $(@D) mktable
endef

define HOST_MKTABLE_INSTALL_CMDS
    $(INSTALL) -D -m 0755 $(@D)/mktable $(HOST_DIR)/usr/bin/mktable
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
