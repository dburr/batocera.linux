################################################################################
#
# GW
#
################################################################################
LIBRETRO_GW_VERSION = 687c760174d23fd026cd1fe9569333a6582a628a
LIBRETRO_GW_SITE = $(call github,libretro,gw-libretro,$(LIBRETRO_GW_VERSION))

define LIBRETRO_GW_BUILD_CMDS
	CFLAGS="$(TARGET_CFLAGS)" CXXFLAGS="$(TARGET_CXXFLAGS)" $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile.libretro platform="$(LIBRETRO_PLATFORM)"
endef

define LIBRETRO_GW_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/gw_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/gw_libretro.so
endef

$(eval $(generic-package))
