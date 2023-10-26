
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tsmat
PKG_VERSION:=0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/antoncom/tsmat.git
PKG_MIRROR_HASH:=36bb0b566962b7ea5a63d75dad309cf558194c381cac66b758979ff952de9331
PKG_SOURCE_VERSION:=770ad27e140b7b50b9c6a3f48f24e7486eb42fcd
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/tsmat
    SUBMENU:=Technoskver
    SECTION:=net
    CATEGORY:=Neoway N725
    TITLE:=Tsmat
    DEPENDS:=+libuci +libjson-c +liblog
endef

define Package/tsmat/description
    Tsmat is an AT gateway for the Neoway N725 AT API. Instead of use terminal to request/response AT-commands 
    on some USB port, like /dev/ttyUSB0, tsmodem library uses Tsmat as FIFO pipes to send 
    AT-commands and receive AT-response from GSM modem of N725 module.
endef


#--------------------------------------------------------------
# Include definition
#--------------------------------------------------------------
COMMON_USR_DIR=/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr
INC_DIR=  -I$(PKG_BUILD_DIR)/include
USR_INC_DIR = -I$(COMMON_USR_DIR)/include

#--------------------------------------------------------------
# LIB
#--------------------------------------------------------------
STD_LIB_FILES =	-ldl -lpthread -lm -lrilutil -llog -lprop2uci -luci -lubox -lubus -lblobmsg_json -ljson_script -ljson-c
USR_LIB_FILES = -lnwy_service -lnwy_common
LDFLAGS += -L$(COMMON_USR_DIR)/lib
LDFLAGS += -L$(PKG_BUILD_DIR)/libs

#--------------------------------------------------------------
# Source code files
#--------------------------------------------------------------

LOCAL_SRC_FILES = tsmat.c
LOCAL_OBJECTS = $(notdir $(patsubst %.c, %.o,$(LOCAL_SRC_FILES)))
		
#--------------------------------------------------------------
# Compilation options
#--------------------------------------------------------------
#set CFLAGS
LOCAL_CFLAGS = -Werror -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard


define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(TAR) -xzf $(DL_DIR)/$(PKG_SOURCE) --strip=1 -C $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

# define Build/Compile
# 		echo "----------------" $(TARGET_LDFLAGS)
# 		$(MAKE) -C $(PKG_BUILD_DIR) \
# 		CC="$(TARGET_CC)" \
# 		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
# 		LDFLAGS="$(TARGET_LDFLAGS)"
# endef

define Build/Compile
	echo "======== NEW MAKEFILE ===== 33 == INC_DIR: " $(PKG_BUILD_DIR)
	#$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/helloworld.o -c $(PKG_BUILD_DIR)/helloworld.c
	#$(TARGET_CC) $(TARGET_LDFLAGS) -o $(PKG_BUILD_DIR)/$1 $(PKG_BUILD_DIR)/helloworld.o
	#$(TARGET_CC) $(TARGET_CFLAGS) $(INC_DIR) $(USR_INC_DIR) $(STD_LIB_FILES) $(USR_LIB_FILES) $(LDFLAGS) -o $(PKG_BUILD_DIR)/tsmat.o -c $(PKG_BUILD_DIR)/tsmat.c
	#$(TARGET_CC) $(TARGET_CFLAGS) $(INC_DIR) $(USR_INC_DIR) $(STD_LIB_FILES) $(USR_LIB_FILES) $(LDFLAGS) -o $(PKG_BUILD_DIR)/$1 $(PKG_BUILD_DIR)/tsmat.o
	#$(TARGET_CC) $(TARGET_CFLAGS) $(INC_DIR) $(USR_INC_DIR) $(PKG_BUILD_DIR)/tsmat.c $(STD_LIB_FILES) $(USR_LIB_FILES) $(LDFLAGS) -o $(PKG_BUILD_DIR)/$1
	#arm-openwrt-linux-muslgnueabi-gcc -Werror -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard  $(INC_DIR) $(USR_INC_DIR) $(PKG_BUILD_DIR)/tsmat.c -ldl -lpthread -lm -lrilutil -llog -lprop2uci -luci -lubox -lubus -lblobmsg_json -ljson_script -ljson-c -lnwy_service -lnwy_common -L/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr/lib -L$(PKG_BUILD_DIR)/libs  -o tsmat
	# arm-openwrt-linux-muslgnueabi-gcc -Werror -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard  -I /home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/include -I/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr/include $(PKG_BUILD_DIR)/tsmat.c -ldl -lpthread -lm -lrilutil -llog -lprop2uci -luci -lubox -lubus -lblobmsg_json -ljson_script -ljson-c -lnwy_service -lnwy_common -L/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr/lib -L/home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/libs  -o $(PKG_BUILD_DIR)/tsmat
	arm-openwrt-linux-muslgnueabi-gcc -Werror -march=armv7-a -mfpu=neon-vfpv4 -mfloat-abi=hard  -I /home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/include -I/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr/include /home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/tsmat.c -ldl -lpthread -lm -lrilutil -llog -lprop2uci -luci -lubox -lubus -lblobmsg_json -ljson_script -ljson-c -lnwy_service -lnwy_common -L/home/anton/work/N725/ext_toolchain/N725_OPEN_WRT_SDK_V2.35/tool/neoway-arm-oe-linux/sysroots/usr/lib -L/home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/libs  -o /home/anton/work/N725/ext_toolchain/openwrt_21.02.7/build_dir/target-arm-openwrt-linux-muslgnueabi_musl/tsmat-0.1/tsmat
endef

define Package/tsmat/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tsmat.init $(1)/etc/init.d/tsmat
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/tsmat.sh $(1)/usr/sbin/tsmat
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tsmat $(1)/usr/bin/tsmat
endef

$(eval $(call BuildPackage,tsmat))
#$(eval $(call BuildPackage,tsmat,+liblog))
