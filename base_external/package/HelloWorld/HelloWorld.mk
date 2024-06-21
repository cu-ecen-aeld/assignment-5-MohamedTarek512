################################################################################
# HelloWorld Makefile
################################################################################

HELLOWORLD_VERSION = 1.0
HELLOWORLD_SITE = /home/mohamed/assignment-5-MohamedTarek512/base_external/package/HelloWorld
HELLOWORLD_LICENSE = COPYING
HELLOWORLD_INSTALL_STAGING = YES
HELLOWORLD_SITE_METHOD = local

define HELLOWORLD_BUILD_CMDS
    # No build commands needed since the binary is already compiled
endef

define HELLOWORLD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(HELLOWORLD_SITE)/HelloWorld $(TARGET_DIR)/usr/bin/HelloWorld
endef

$(eval $(generic-package))

