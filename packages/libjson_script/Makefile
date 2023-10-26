
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=libjson_script
PKG_VERSION:=1
PKG_RELEASE:=1
PKG_SOURCE:=libjson_script.tar.gz
PKG_SOURCE_URL:=https://github.com/antoncom/rtr-2-openwrt-fw-n725/raw/opkg-custom-installer/packages/libjson_script/files/
PKG_HASH:=f3d83c228f0cae0e68e401b4fea2478d8051fff1b8926f6d2638c896b92c1109

include $(INCLUDE_DIR)/package.mk

define Package/libjson_script
    SUBMENU:=Technoskver
    SECTION:=examples
    CATEGORY:=Neoway N725
    TITLE:=libjson_script
    DEPENDS:=libubox
endef

define Package/libjson_script/description
    
endef


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/libjson_script/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libjson_script.so.20210516 $(1)/usr/lib/libjson_script.so.20210516
endef

$(eval $(call BuildPackage,libjson_script))
