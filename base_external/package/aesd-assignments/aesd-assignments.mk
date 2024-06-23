################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = 4e95b14
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-MohamedTarek512
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
AESD_ASSIGNMENTS_LICENSE = GPL-2.0
AESD_ASSIGNMENTS_LICENSE_FILES = LICENSE
AESDSOCKET_INSTALL_STAGING = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    aarch64-none-linux-gnu-gcc -Wall -Werror -o $(@D)/server/aesdsocket $(@D)/server/aesdsocket.c
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

define AESD_ASSIGNMENTS_INSTALL_STAGING_CMDS
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(STAGING_DIR)/usr/bin/aesdsocket
endef

$(eval $(generic-package))
