MODULE_SRC_DIR = src/source/mod_src

obj-m += bbqX0kbd.o
bbqX0kbd-objs += $(MODULE_SRC_DIR)/main.o \
				 $(MODULE_SRC_DIR)/input_iface.o \
				 $(MODULE_SRC_DIR)/params_iface.o \
				 $(MODULE_SRC_DIR)/sysfs_iface.o
ccflags-y := -DDEBUG -g -std=gnu99 -Wno-declaration-after-statement

.PHONY: all clean

all:
	$(MAKE) -C '$(LINUX_DIR)' M='$(PWD)' modules

clean:
	$(MAKE) -C '$(LINUX_DIR)' M='$(PWD)' clean
