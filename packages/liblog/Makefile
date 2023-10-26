
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=liblog
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=liblog.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/liblog/files/
PKG_HASH:=9985ca066c5f9bc79c3e6e26b7cdd41703a29e35de9881b80d09104c70041fd9

include $(INCLUDE_DIR)/package.mk

define Package/liblog
    SUBMENU:=Technoskver
    SECTION:=net
    CATEGORY:=Neoway N725
    TITLE:=liblog
    DEPENDS:=libprop2uci
endef

define Package/liblog/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/liblog/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/liblog.so $(1)/usr/lib/liblog.so
endef

$(eval $(call BuildPackage,liblog))
