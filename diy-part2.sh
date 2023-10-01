#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================


### perl-html-parser 
 

# Modify default IP
#sed -i 's/192.168.1.1/192.168.2.100/g' package/base-files/files/bin/config_generate
sudo -E apt-get update
sudo -E apt-get -y install opencc
cp -r $GITHUB_WORKSPACE/package/* $GITHUB_WORKSPACE/x-wrt/package/
cd $GITHUB_WORKSPACE/x-wrt/
git clone https://github.com/tvheadend/tvheadend.git
cp -r $GITHUB_WORKSPACE/x-wrt/tvheadend/.git $GITHUB_WORKSPACE/x-wrt/package/tvheadend/files/
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=6.1/g' target/linux/ramips/Makefile
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/mvebu/Makefile
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/ipq40xx/Makefile 
rm -r feeds/packages/multimedia/tvheadend
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/tvheadend.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/openwrt/feeds/packages/multimedia/
#rm -r feeds/packages/multimedia/ffmpeg
#tar xvf /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/ffmpeg.tar -C /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/multimedia/
#cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/rtl8821cu /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/penwrt/package/
#cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/n2n /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
#ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-serverchan /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-nlbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
#rm -r $GITHUB_WORKSPACE/x-wrt/package/libs/gettext-full
#cp -r $GITHUB_WORKSPACE/gettext-full $GITHUB_WORKSPACE/x-wrt/package/libs/

#cp $GITHUB_WORKSPACE/patches/999-workqueue.patch $GITHUB_WORKSPACE/x-wrt/target/linux/generic/backport-5.15/

mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-tw
/usr/bin/opencc -i /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-cn/nlbwmon.po -o /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-tw/nlbwmon.po 
#cp $GITHUB_WORKSPACE/*.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/net/lighttpd/patches/

#cp $GITHUB_WORKSPACE/patches/Makefile.nginx $GITHUB_WORKSPACE/x-wrt/feeds/packages/net/nginx/Makefile
#mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/libs/libwebsockets/patches/
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/patches/libwebsockets.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/libs/libwebsockets/patches/
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/patches/Makefile.gnutls /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/libs/gnutls/Makefile
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/patches/030-unistring-optional.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/libs/gnutls/patches/               
cp $GITHUB_WORKSPACE/patches/Makefile.perl-html-parser $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/perl-html-parser/Makefile
#cp $GITHUB_WORKSPACE/patches/Makefile.php8 $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/php8/Makefile
#cp $GITHUB_WORKSPACE/patches/Makefile.python3-packages $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/python/python3-packages/Makefile

cp $GITHUB_WORKSPACE/patches/Makefile.ss /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/net/shadowsocks-libev/Makefile
#cp $GITHUB_WORKSPACE/patches/Makefile.mwlwifi /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/kernel/mwlwifi/Makefile
#mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/net/shadowsocks-libev/patches
#cp $GITHUB_WORKSPACE/ss_server.patch  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/packages/net/shadowsocks-libev/patches

#ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-wrtbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-turboacc /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-turboacc/po/zh_Hant
#cp /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/turboacc.po /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-turboacc/po/zh_Hant/ 
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-ttyd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/packages/net/dnsforwarder /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/packages/net/pdnsd-alt /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
#ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-netdata /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
#ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/target/linux/generic/hack-5.15/953-net-patch-linux-kernel-to-support-shortcut-fe.patch /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/target/linux/generic/hack-5.15/
git clone https://github.com/brvphoenix/wrtbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/wrtbwmon
git clone https://github.com/muink/luci-app-netdata /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-netdata
git clone https://github.com/brvphoenix/luci-app-wrtbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wrtbwmon
git clone https://github.com/tty228/luci-app-wechatpush /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package//luci-app-wechatpush

#mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wrtbwmon/luci-app-wrtbwmon/po/zh_Hant
#/usr/bin/opencc -i /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wrtbwmon/luci-app-wrtbwmon/po/zh_Hans/wrtbwmon.po -o /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wrtbwmon/luci-app-wrtbwmon/po/zh_Hant/wrtwmon.po
mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package//luci-app-wechatpush/po/zh_Hant

rm -r  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/kenzo/luci-app-serverchan/
/usr/bin/opencc -i /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hans/wechatpush.po -o /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hant/wechatpush.po
sed -i 's/zh_Hans/zh_Hant/g' /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hant/wechatpush.po
#cd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/kenzo/luci-app-serverchan/po
#ln -s zh_Hant zh-tw 

cp -r $GITHUB_WORKSPACE/lede/feeds/packages/net/vlmcsd/ $GITHUB_WORKSPACE/x-wrt/package/
cp $GITHUB_WORKSPACE/patches/Makefile.vlmcsd $GITHUB_WORKSPACE/x-wrt/package/vlmcsd/Makefile
cd $GITHUB_WORKSPACE/ 
cp $GITHUB_WORKSPACE/patches/*.patch $GITHUB_WORKSPACE/x-wrt/
#rm -rf x-wrt/feeds/packages/lang/golang
#svn export https://github.com/sbwml/packages_lang_golang/branches/19.x x-wrt/feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-alist x-wrt/package/alist
cp patches/alist.po x-wrt/package/alist/luci-app-alist/po/zh_Hans/
cp myconfig/config* x-wrt/
myconfig=x-wrt/.config
CONFIG_FILE0=myconfig/config.$ROUTER_MODEL.0
CONFIG_FILE1=myconfig/config.$ROUTER_MODEL.1
CONFIG_FILE2=myconfig/config.$ROUTER_MODEL.2
#CONFIG_FILE3=myconfig/config.$ROUTER_MODEL.tvh

#CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config
#if  [ $KERNEL_VERSION  = "5.15" ]
#then
#cp -f $KERNEL_CONFIG.5.15 $KERNEL_CONFIG;cp myconfig/config.$ROUTER_MODEL.0.5_15 myconfig/config.$ROUTER_MODEL.0;cp myconfig/config.$ROUTER_MODEL.1.5_15 myconfig/config.$ROUTER_MODEL.1;cp myconfig/config.$ROUTER_MODEL.2.5_15 myconfig/config.$ROUTER_MODEL.2;cp myconfig/config.$ROUTER_MODEL.3.5_15 myconfig/config.$ROUTER_MODEL.3
#fi
if [ $TVH == true ]; then CONFIG_FILE=$CONFIG_FILE0; cp $CONFIG_FILE $myconfig; cat myconfig/config.tvh.ffmpeg >> $myconfig; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE $myconfig; fi
echo `ls -alt $myconfig`;echo `ls -alt myconfig/config.$ROUTER_MODEL.?`

#if [ $TVH == true ]; then CONFIG_FILE=$CONFIG_FILE1; cp $CONFIG_FILE .config; cat myconfig/config.tvh.ffmpeg >>.config;cat $KERNEL_MODULE >> $KERNEL_CONFIG_DIR/config-$KERNEL_VERSION ; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config; fi
#if [ $TVH == true ]; then CONFIG_FILE=config.$ROUTER_MODEL.tvh;cp $CONFIG_FILE .config; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE .config; fi
#exit 0
[ $CPU_MULTI_CORE == true ] && cat myconfig/base.update >> x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po ##&& git apply x-wrt/processes_sys.patch && sed -i 's/processes.js:72/processes.js:74/g' x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po  && sed -i 's/processes.js:73/processes.js:75/g' x-wrt/feeds/luci/modules/luci-base/po/zh_Hant/base.po

#cd x-wrt/scripts/
#rm download.pl
#wget https://raw.githubusercontent.com/openwrt/openwrt/dce035bb7161cd546927e73b556cd839211b00c8/scripts/download.pl
#chmod 755 download.pl
#cd ../../

### apply patch##### 
#mv $GITHUB_WORKSPACE/patches/200-gcc12-elfutils.patch $GITHUB_WORKSPACE/x-wrt/toolchain/gcc/patches/12.1.0/
mv $GITHUB_WORKSPACE/patches/800-custom-hk.patch $GITHUB_WORKSPACE/x-wrt/package/firmware/wireless-regdb/patches/
cd $GITHUB_WORKSPACE/x-wrt/
#./scripts/feeds install -f luci-app-serverchan
#wget -qO- https://patchwork.kernel.org/project/linux-wireless/patch/20220908173618.155291-2-hdegoede@redhat.com/raw/ > package/kernel/mac80211/patches/rt2x00/612-rt2x00-ap-assoc-invalid-queue-2.patch
sed -i 's/set wireless.${name}.disabled=1/set wireless.${name}.disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#git apply --ignore-space-change --ignore-whitespace libtins.patch
#git apply --ignore-space-change --ignore-whitespace rule.patch
git apply --ignore-space-change --ignore-whitespace netdata.patch                                                                                                                                                
git apply --ignore-space-change --ignore-whitespace fs.patch
#git apply --ignore-space-change --ignore-whitespace jq.patch
git apply --ignore-space-change --ignore-whitespace ramips.patch
git apply --ignore-space-change --ignore-whitespace common.patch
git apply --ignore-space-change --ignore-whitespace revert_set_default_root.patch
#git apply --ignore-space-change --ignore-whitespace rrdtool.patch
git apply --ignore-space-change --ignore-whitespace r619ac.patch
#git apply --ignore-space-change --ignore-whitespace ocserv.patch
#mkdir -p $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/python/python-pycparser
#cp $GITHUB_WORKSPACE/patches/Makefile.python-pycparser  $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/python/python-pycparser/Makefile
#cp $GITHUB_WORKSPACE/patches/elfutils.Makefile $GITHUB_WORKSPACE/x-wrt/package/libs/elfutils/Makefile
#git revert 789a6b7
#cp $GITHUB_WORKSPACE/lede/package/kernel/linux/modules/fs.mk $GITHUB_WORKSPACE/x-wrt/package/kernel/linux/modules/
#cp $GITHUB_WORKSPACE/lede/target/linux/generic/backport-5.10/35?*.patch $GITHUB_WORKSPACE/x-wrt/target/linux/generic/backport-5.10/
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
