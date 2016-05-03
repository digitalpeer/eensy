################################################################################
#
# gogs
#
################################################################################

GOGS_VERSION = v0.9.13_linux_arm
GOGS_SOURCE = gogs_$(GOGS_VERSION).zip
GOGS_SITE = https://dl.gogs.io
GOGS_LICENSE = MIT
GOGS_LICENSE_FILES = LICENSE

define GOGS_EXTRACT_CMDS
	unzip $(DL_DIR)/$(GOGS_SOURCE) -d $(@D)
endef

define GOGS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/opt/
	cp -a $(@D)/* $(TARGET_DIR)/opt/
endef

$(eval $(generic-package))
