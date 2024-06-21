################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_LICENSE = GPL-2.0
AESD_ASSIGNMENTS_LICENSE_FILES = LICENSE

# Add local path
AESD_ASSIGNMENTS_SITE = /home/mohamed/assignment-5-MohamedTarek512/base_external/package/aesd-assignments
AESD_ASSIGNMENTS_SITE_METHOD = local
AESDSOCKET_INSTALL_STAGING = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) -C $(@D)/server
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))

