
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
PKG_HASH:=0deff76fbc026e52f7dfdcbc52bc904a673179047ed38403e231667fa5d22a01

include $(INCLUDE_DIR)/package.mk

define Package/libubus
    SUBMENU:=Technoskver
    SECTION:=examples
    CATEGORY:=Neoway N725
    TITLE:=libubus
    DEPENDS:=
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
