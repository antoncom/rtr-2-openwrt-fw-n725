
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=librilutil
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=librilutil.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/librilutil/files/
PKG_HASH:=5818c8d510af5b4df6f586bbc389cc57114a095d1e8ecab503eed3bb1dd25576

include $(INCLUDE_DIR)/package.mk

define Package/librilutil
    SUBMENU:=Technoskver
    SECTION:=examples
    CATEGORY:=Neoway N725
    TITLE:=librilutil
    DEPENDS:=libubox +libubus
endef

define Package/librilutil/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/librilutil/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/librilutil.so $(1)/usr/lib/librilutil.so
endef

$(eval $(call BuildPackage,librilutil))
