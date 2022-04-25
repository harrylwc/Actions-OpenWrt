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
tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/tvheadend.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/feeds/packages/multimedia/
cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/rtl8821cu /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/
cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/n2n /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/
sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/ramips/Makefile
#mv /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/rtl8821cu/patches/050-ioctl_kernel5.10.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/rtl8821cu/
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/rtl8821.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/
#rm -r /workdir/lede/package/lean/mt/drivers/
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/config.ipq4019 /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/target/linux/ipq40xx/
#url=
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/bin/ root@url:/mnt/x-wrt/bin
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/.config root@url:/mnt/x-wrt/.config                           
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/config* root@url:/mnt/x-wrt/   
