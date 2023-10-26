
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libubus.so.20210630
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=libubus.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/libubus/files/
PKG_HASH:=5fda15ee65d63c8c293512f5fede63c49fe9b716ca9a9b21d5747fda0cbb6d4f

include $(INCLUDE_DIR)/package.mk

define Package/libubus
    SUBMENU:=Technoskver
    SECTION:=examples
    CATEGORY:=Neoway N725
    TITLE:=libubus
    DEPENDS:=libubox
endef

define Package/libubus/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libubus/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libubus.so.20210630 $(1)/usr/lib/libubus.so.20210630
endef

$(eval $(call BuildPackage,libubus))
