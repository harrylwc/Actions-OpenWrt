#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package && git clone https://github.com/jerrykuku/luci-theme-argon.git  

#ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/package/lean /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/
cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package && ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/package/lean .
