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
cd $GITHUB_WORKSPACE/x-wrt/
rm -r feeds/packages/multimedia/tvheadend
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/tvheadend.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/feeds/packages/multimedia/
rm -r feeds/packages/multimedia/ffmpeg
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/ffmpeg.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/multimedia/
#cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/rtl8821cu /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/penwrt/package/
#cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/n2n /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/

cp -r $GITHUB_WORKSPACE/package/* $GITHUB_WORKSPACE/x-wrt/package/
cp -r $GITHUB_WORKSPACE/lede/feeds/packages/net/vlmcsd/ $GITHUB_WORKSPACE/x-wrt/package/
cd $GITHUB_WORKSPACE/ 

myconfig=x-wrt/.config
CONFIG_FILE0=myconfig/config.$ROUTER_MODEL.0
CONFIG_FILE1=myconfig/config.$ROUTER_MODEL.1
CONFIG_FILE2=myconfig/config.$ROUTER_MODEL.2
#CONFIG_FILE3=myconfig/config.$ROUTER_MODEL.tvh

#CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config
if [ $TVH == true ]; then CONFIG_FILE=$CONFIG_FILE0; cp $CONFIG_FILE $myconfig; cat myconfig/config.tvh.ffmpeg >> $myconfig; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE $myconfig; fi
echo `ls -alt $myconfig`;echo `ls -alt myconfig/config.$ROUTER_MODEL.?`;cat .config|grep tvheadend

#if [ $TVH == true ]; then CONFIG_FILE=$CONFIG_FILE1; cp $CONFIG_FILE .config; cat myconfig/config.tvh.ffmpeg >>.config;cat $KERNEL_MODULE >> $KERNEL_CONFIG_DIR/config-$KERNEL_VERSION ; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config; fi
#if [ $TVH == true ]; then CONFIG_FILE=config.$ROUTER_MODEL.tvh;cp $CONFIG_FILE .config; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config; fi
#exit 0
[ $CPU_MULTI_CORE == true ] && cat myconfig/base.update >> x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po && cp $UPDATE_MULTI_CORE_FILE1 x-wrt/feeds/luci/modules/luci-base/luasrc/sys.lua && cp $UPDATE_MULTI_CORE_FILE2 x-wrt/feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/processes.js && sed -i 's/processes.js:72/processes.js:74/g' x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po  && sed -i 's/processes.js:73/processes.js:75/g' x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po

### apply patch##### 

mv $GITHUB_WORKSPACE/patches/800-custom-hk.patch $GITHUB_WORKSPACE/x-wrt/package/firmware/wireless-regdb/patches/
cp $GITHUB_WORKSPACE/patches/*.patch $GITHUB_WORKSPACE/x-wrt/
cd $GITHUB_WORKSPACE/x-wrt/
git apply *.patch

exit 0

#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/ramips/Makefile
#mv /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/rtl8821cu/patches/050-ioctl_kernel5.10.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/rtl8821cu/
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/rtl8821.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/package/
#rm -r /workdir/lede/package/lean/mt/drivers/
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/config.ipq4019 /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/target/linux/ipq40xx/
#url=
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/bin/ root@url:/mnt/x-wrt/bin
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/.config root@url:/mnt/x-wrt/.config                           
#rsync -Pav --delete -e "rsh -p 412 " /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/config* root@url:/mnt/x-wrt/   
