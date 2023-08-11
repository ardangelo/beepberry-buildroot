LIBGC_VERSION = 8.2.4
LIBGC_SOURCE = libgc_$(LIBGC_VERSION).orig.tar.gz
LIBGC_SITE = http://deb.debian.org/debian/pool/main/libg/libgc

LIBGC_INSTALL_STAGING = YES

$(eval $(autotools-package))
$(eval $(host-autotools-package))

