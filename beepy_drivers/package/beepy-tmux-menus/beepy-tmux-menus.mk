BEEPY_TMUX_MENUS_VERSION = 1.0
BEEPY_TMUX_MENUS_BASE = $(BR2_EXTERNAL_BEEPY_DRIVERS_PATH)/package/beepy-tmux-menus
BEEPY_TMUX_MENUS_SITE = $(BEEPY_TMUX_MENUS_BASE)/module
BEEPY_TMUX_MENUS_SITE_METHOD = local

BEEPY_TMUX_MENUS_INSTALL_IMAGES = YES
BEEPY_TMUX_MENUS_MODULE_SUBDIRS = .

define BEEPY_TMUX_MENUS_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/beepy-tmux-menus/
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/beepy-tmux-menus/
endef

$(eval $(generic-package))
