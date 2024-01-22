################################################################################
#
# cmus
#
################################################################################


CMUS_VERSION = 2.10.0
CMUS_SOURCE = v$(CMUS_VERSION).tar.gz
CMUS_SITE = https://github.com/cmus/cmus/archive
CMUS_DEPENDENCIES  = host-pkgconf ncurses alsa-lib

define CMUS_CONFIGURE_CMDS
    (cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) \
		$(TARGET_CONFIGURE_ARGS) \
        ./configure \
		LD="$(GCC)" \
		HOSTLD="$(HOSTCC)" \
		prefix="/usr" \
    )
endef

define CMUS_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) V=2 -C $(@D) all
endef

define CMUS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(generic-package))
