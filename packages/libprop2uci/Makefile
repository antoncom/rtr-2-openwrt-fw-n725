
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=liblog
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=libprop2.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/libprop2/files/
PKG_HASH:=9985ca066c5f9bc79c3e6e26b7cdd41703a29e35de9881b80d09104c70041fd9

include $(INCLUDE_DIR)/package.mk

define Package/liblog
    SUBMENU:=Technoskver
    SECTION:=net
    CATEGORY:=Neoway N725
    TITLE:=libprop2
    DEPENDS:=
endef

define Package/libprop2/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1 -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libprop2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libprop2.so $(1)/usr/lib/libprop2.so
endef

$(eval $(call BuildPackage,libprop2))
