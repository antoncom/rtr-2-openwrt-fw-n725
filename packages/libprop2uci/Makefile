
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libprop2uci
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=libprop2uci.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/libprop2uci/files/
PKG_HASH:=0deff76fbc026e52f7dfdcbc52bc904a673179047ed38403e231667fa5d22a01

include $(INCLUDE_DIR)/package.mk

define Package/libprop2uci
    SUBMENU:=Technoskver
    SECTION:=examples
    CATEGORY:=Neoway N725
    TITLE:=libprop2uci
    DEPENDS:=libuci
endef

define Package/libprop2uci/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libprop2uci/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libprop2uci.so $(1)/usr/lib/libprop2uci.so
endef

$(eval $(call BuildPackage,libprop2uci))
