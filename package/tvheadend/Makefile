#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tvheadend
PKG_VERSION:=4.3
PKG_RELEASE:=0

PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_VERSION:=master

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/tvheadend/tvheadend.git

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)


PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE.md

PKG_FIXUP:=autoreconf

PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/tvheadend
  SECTION:=multimedia
  CATEGORY:=Multimedia
  TITLE:=Tvheadend is a TV streaming server for Linux
  DEPENDS:=+libdvbcsa +libvpx +libvorbis +libtheora +libopusenc +fdk-aac +libffmpeg +ffmpeg +libx264 +libpcre2 +libopenssl +librt +zlib +TVHEADEND_AVAHI_SUPPORT:libavahi-client $(ICONV_DEPENDS)
  URL:=https://tvheadend.org
  MAINTAINER:=CZ.NIC <packaging@turris.cz>
endef

  #DEPENDS:= \
	#+librt \
	#3+libffi \
	#+libopenssl \
	#$(ICONV_DEPENDS) \
	#+zlib \
	#+TVHEADEND_AVAHI_SUPPORT:libavahi-client \
	#+TVHEADEND_REGEX_PCRE:libpcre \
	#+TVHEADEND_REGEX_PCRE2:libpcre2 \
	#+BUILD_PATENTED&&TVHEADEND_CSA:libdvbcsa

## Transcoding | Add these to DEPENDS.
##	+TVHEADEND_LIBFFMPEG:libffmpeg-full \
##	+TVHEADEND_LIBVPX:libvpx \
##	+TVHEADEND_LIBTHEORA:libtheora \
##	+TVHEADEND_LIBVORBIS:libvorbis \
##	+TVHEADEND_LIBOPUS:libopusenc \
##	+TVHEADEND_LIBFDKAAC:fdk-aac \
##	+BUILD_PATENTED&&TVHEADEND_LIBX264:libx264 \






define Package/tvheadend/description
  Tvheadend is a TV streaming server and recorder for Linux, FreeBSD and Android
  supporting DVB-S, DVB-S2, DVB-C, DVB-T, ATSC, IPTV, SAT>IP and HDHomeRun as input sources.

  Tvheadend offers the HTTP (VLC, MPlayer), HTSP (Kodi, Movian) and SAT>IP streaming.
endef

define Package/tvheadend/config
  menu "Configuration"
  depends on PACKAGE_tvheadend
  source "$(SOURCE)/Config.in"
  endmenu
endef

ifeq ($(CONFIG_BUILD_NLS),y)
  ifeq ($(CONFIG_TVHEADEND_ENABLE_BUNDLE),y)
    CONFIGURE_ARGS += --enable-bundle
    TARGET_LDFLAGS += $(if $(ICONV_FULL),-liconv)
  endif
endif

ifeq ($(CONFIG_TVHEADEND_CWC_SUPPORT),)
  CONFIGURE_ARGS += --disable-cwc
endif

ifeq ($(CONFIG_TVHEADEND_LINUXDVB_SUPPORT),)
  CONFIGURE_ARGS += --disable-linuxdvb
endif

ifeq ($(CONFIG_TVHEADEND_DVBSCAN_SUPPORT),)
  CONFIGURE_ARGS += --disable-dvbscan
endif

ifeq ($(CONFIG_TVHEADEND_AVAHI_SUPPORT),)
  CONFIGURE_ARGS += --disable-avahi
else
  CONFIGURE_ARGS += --enable-avahi
endif

ifeq ($(CONFIG_TVHEADEND_DVBCSA_SUPPORT),)
else
  CONFIGURE_ARGS += --enable-dvbcsa --disable-tvhcsa
endif
ifeq ($(CONFIG_DISABLE_TVHCSA_DVBCSA_SUPPORT),)
else
  CONFIGURE_ARGS += --disable-dvbcsa --disable-tvhcsa
endif

ifeq ($(CONFIG_DISABLE_TVHEADEND_FULL_SUPPORT),)
else 
  CONFIGURE_ARGS += --disable-libav --disable-dbus_1 --disable-capmt --disable-constcw --disable-iptv --disable-satip_server --disable-satip_client --disable-imagecache --disable-uriparser --disable-libx264 --disable-libx264_static --disable-libmfx_static --disable-libx265_static --disable-hdhomerun_client --disable-hdhomerun_static --disable-cwc --disable-cccam
endif

CONFIGURE_ARGS += \
	--arch=$(ARCH) \
	--disable-dbus_1 \
	--disable-libx264_static \
	--disable-ffmpeg_static \
	--disable-libx265 \
	--disable-hdhomerun \
	--enable-libx265_static \
	--disable-execinfo

#TARGET_CFLAGS += -Wno-error=pointer-compare -ggdb3 -O0
TARGET_CFLAGS += -Wno-format-security -Wno-error=array-bounds -Wno-error=address 

define Build/Prepare
	cp -r ~/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/tvheadend/.git $(PKG_BUILD_DIR)/
	$(call Build/Prepare/Default)
	#echo 'Tvheadend $(shell echo $(PKG_SOURCE_VERSION) | sed "s/^v//")~openwrt$(PKG_RELEASE)' \
		#> $(PKG_BUILD_DIR)/debian/changelog
endef

define Package/conffiles
/etc/config/tvheadend
endef

define Package/tvheadend/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/tvheadend.init $(1)/etc/init.d/tvheadend
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/tvheadend.config $(1)/etc/config/tvheadend

	$(MAKE) -C $(PKG_BUILD_DIR) install DESTDIR=$(1)
endef

$(eval $(call BuildPackage,tvheadend))
