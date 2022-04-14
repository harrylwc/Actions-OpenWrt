#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.2.100/g' package/base-files/files/bin/config_generate
cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt
rm -r feeds/packages/multimedia/tvheadend
cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/ && tar xvf tvheadend.tar openwrt/feeds/packages/multimedia/
cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/ && tar xvf rtl8821.tar openwrt/package/
