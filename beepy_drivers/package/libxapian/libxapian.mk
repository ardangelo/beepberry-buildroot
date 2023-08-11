LIBXAPIAN_VERSION = 1.4.23
LIBXAPIAN_SOURCE = xapian-core-$(LIBXAPIAN_VERSION).tar.xz
LIBXAPIAN_SITE = https://oligarchy.co.uk/xapian/1.4.23

LIBXAPIAN_DEPENDENCIES = libunwind libzlib util-linux

LIBXAPIAN_INSTALL_STAGING = YES

$(eval $(autotools-package))

