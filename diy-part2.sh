


sudo -E apt-get update
sudo -E apt-get -y install opencc

sudo apt install libcurl4-openssl-dev libssl-dev
cp -r $GITHUB_WORKSPACE/package/* $GITHUB_WORKSPACE/x-wrt/package/
cd $GITHUB_WORKSPACE/x-wrt/
git clone https://github.com/tvheadend/tvheadend.git

cp -r $GITHUB_WORKSPACE/x-wrt/tvheadend/.git $GITHUB_WORKSPACE/x-wrt/package/tvheadend/files/
rm -r feeds/packages/multimedia/tvheadend
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-nlbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
rm $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/rust/patches/0003-bump-libc-deps-to-0.2.146.patch
cp $GITHUB_WORKSPACE/patches/swconfig* $GITHUB_WORKSPACE/x-wrt/target/linux/generic/files/drivers/net/phy/
cp $GITHUB_WORKSPACE/patches/Makefile.rust  $GITHUB_WORKSPACE/x-wrt/package/feeds/packages/rust/Makefile
cp $GITHUB_WORKSPACE/patches/Makefile.ruby  $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/ruby/Makefile
cp $GITHUB_WORKSPACE/patches/422.patch $GITHUB_WORKSPACE/patches/x-wrt/package/kernel/mwlwifi/patches/

cp $GITHUB_WORKSPACE/patches/0003-mutils_time.patch $GITHUB_WORKSPACE/x-wrt/package/feeds/packages/mailsend/patches/
cp $GITHUB_WORKSPACE/patches/060-binutils.patch $GITHUB_WORKSPACE/x-wrt/feeds/packages/multimedia/ffmpeg/patches/
cp $GITHUB_WORKSPACE/patches/030-h264-mips.patch $GITHUB_WORKSPACE/x-wrt/feeds/packages/multimedia/ffmpeg/patches/

#mkdir ~/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/feeds/kenzo/luci-app-easymesh/po/zh_Hant
#/usr/bin/opencc -i ~/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/feeds/kenzo/luci-app-easymesh/po/zh-cn/easymesh.po -o ~/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/feeds/kenzo/luci-app-easymesh/po/zh_Hant/easymesh.po

#mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-tw
#/usr/bin/opencc -i /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-cn/nlbwmon.po -o /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-nlbwmon/po/zh-tw/nlbwmon.po 



cp $GITHUB_WORKSPACE/patches/10?-* $GITHUB_WORKSPACE/x-wrt/package/libs/mbedtls/patches
cp $GITHUB_WORKSPACE/patches/Config.in.mbedtls $GITHUB_WORKSPACE/x-wrt/package/libs/mbedtls/Config.in
cp $GITHUB_WORKSPACE/patches/Makefile.mbedtls $GITHUB_WORKSPACE/x-wrt/package/libs/mbedtls/Makefile                                                                                                                                                                      
rm -rf $GITHUB_WORKSPACE/x-wrt/package/libs/mbedtls/patches/100-fix-gcc14-build.patch



cp -r /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-turboacc /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-turboacc/po/zh_Hant
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/luci/applications/luci-app-ttyd /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/packages/net/dnsforwarder /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
ln -s /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/lede/feeds/packages/net/pdnsd-alt /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/
git clone https://github.com/brvphoenix/wrtbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/wrtbwmon
git clone https://github.com/muink/luci-app-netdata /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-netdata
cp $GITHUB_WORKSPACE/patches/Makefile.netdata /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-netdata/Makefile
git clone https://github.com/brvphoenix/luci-app-wrtbwmon /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wrtbwmon
git clone https://github.com/tty228/luci-app-wechatpush /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package//luci-app-wechatpush

#mkdir /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package//luci-app-wechatpush/po/zh_Hant
#/usr/bin/opencc -i /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hans/wechatpush.po -o /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hant/wechatpush.po
#sed -i 's/zh_Hans/zh_Hant/g' /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-wechatpush/po/zh_Hant/wechatpush.po
sed -i 's/llvm=true/llvm=false/g' $GITHUB_WORKSPACE/x-wrt/feeds/packages/lang/rust/Makefile
cp -r $GITHUB_WORKSPACE/lede/feeds/packages/net/vlmcsd/ $GITHUB_WORKSPACE/x-wrt/package/
cp $GITHUB_WORKSPACE/patches/Makefile.vlmcsd $GITHUB_WORKSPACE/x-wrt/package/vlmcsd/Makefile
cd $GITHUB_WORKSPACE/ 
cp $GITHUB_WORKSPACE/patches/*.patch $GITHUB_WORKSPACE/x-wrt/
git clone https://github.com/sbwml/luci-app-alist x-wrt/package/alist
cp patches/alist.po x-wrt/package/alist/luci-app-alist/po/zh_Hans/
cp myconfig/config* x-wrt/
myconfig=x-wrt/.config
CONFIG_FILE0=myconfig/config.$ROUTER_MODEL.0
CONFIG_FILE1=myconfig/config.$ROUTER_MODEL.1
CONFIG_FILE2=myconfig/config.$ROUTER_MODEL.2

if  [ $KERNEL_VERSION  = "5.15" ]
then
cp -f $KERNEL_CONFIG.5.15 $KERNEL_CONFIG;cp myconfig/config.$ROUTER_MODEL.0.5_15 myconfig/config.$ROUTER_MODEL.0;cp myconfig/config.$ROUTER_MODEL.1.5_15 myconfig/config.$ROUTER_MODEL.1;cp myconfig/config.$ROUTER_MODEL.2.5_15 myconfig/config.$ROUTER_MODEL.2;cp myconfig/config.$ROUTER_MODEL.3.5_15 myconfig/config.$ROUTER_MODEL.3
fi
if [ $TVH == true ]; then CONFIG_FILE=$CONFIG_FILE0; cp $CONFIG_FILE $myconfig; cat myconfig/config.tvh.ffmpeg >> $myconfig; else CONFIG_FILE=$CONFIG_FILE2 && cp $CONFIG_FILE $myconfig; fi
echo `ls -alt $myconfig`;echo `ls -alt myconfig/config.$ROUTER_MODEL.?`
#rm -rf  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/luci/applications/luci-app-filebrowser
/usr/bin/opencc -i $GITHUB_WORKSPACE/x-wrt/package/openwrt-packages/luci-app-fileassistant/luasrc/view/fileassistant.htm -o $GITHUB_WORKSPACE/x-wrt/package/openwrt-packages/luci-app-fileassistant/luasrc/view/fileassistant.htm

for i in `find $GITHUB_WORKSPACE/x-wrt/feeds/ -name po`
do
        if [ ! -d "$i/zh_Hant" ] || [ ! -d "$i/zh-tw" ] 
        then
        mkdir $i/zh_Hant
        for x in `find $i|grep -E "zh-cn|zh_Hans"|grep "\.po"`
              do
                y=`echo $x|sed -e 's/zh-cn/zh_Hant/g' -e 's/zh_Hans/zh_Hant/g'`
                /usr/bin/opencc -i $x -o $y
        #echo $y
               
        done
        fi
done
ttl=`find $GITHUB_WORKSPACE/x-wrt/feeds/ -name *.po|grep zh_Hant|wc -l`
echo "Total zh_Hant in feeds directory = $ttl"

for i in `find $GITHUB_WORKSPACE/x-wrt/package/ -name po`
do
        if [ ! -d "$i/zh_Hant" ] || [ ! -d "$i/zh-tw" ] 
        then
        mkdir $i/zh_Hant
        for x in `find $i|grep -E "zh-cn|zh_Hans"|grep "\.po"`
              do
                y=`echo $x| -e 's/zh-cn/zh_Hant/g' -e 's/zh_Hans/zh_Hant/g'`
                /usr/bin/opencc -i $x -o $y
        #echo $y
             
        done
        fi
done

ttl=`find $GITHUB_WORKSPACE/x-wrt/package/ -name *.po|grep zh_Hant|wc -l`
echo "Total zh_Hant in package directory = $ttl"

for i in `find $GITHUB_WORKSPACE/x-wrt/feeds/x/ -name *.po|grep cn`    
do 
       # echo $i
        /usr/bin/opencc -i $i -o $i                                                                                                                                                                        
done

cd /tmp/                                                                                                                                            
wget https://raw.githubusercontent.com/x-wrt/x-wrt/refs/heads/master/package/firmware/wireless-regdb/patches/600-custom-change-txpower-and-dfs.patch
wget https://raw.githubusercontent.com/x-wrt/x-wrt/refs/heads/master/package/firmware/wireless-regdb/patches/500-world-regd-5GHz.patch
mv /tmp/*.patch $GITHUB_WORKSPACE/x-wrt/package/firmware/wireless-regdb/patches/       
mv $GITHUB_WORKSPACE/patches/400-custom_hk-change-txpower-and-dfs.patch $GITHUB_WORKSPACE/x-wrt/package/firmware/wireless-regdb/patches/

cd $GITHUB_WORKSPACE/x-wrt/
cd dl
wget http://weike-iot.com:2211/rockchip/bsp/rk3568_OpenWRT/downloads/ddnsto-binary-3.0.4.tar.gz
cd ..
mv package/feeds/video/wayland /tmp/

git apply -R --ignore-space-change --ignore-whitespace revert_set_default_root.patch 
#git apply -R --ignore-space-change --ignore-whitespace mtk_eth_soc1.patch
#git apply -R --ignore-space-change --ignore-whitespace mtk_eth_soc.patch
#git apply --ignore-space-change --ignore-whitespace netdata.patch                                                                                                                                                
git apply --ignore-space-change --ignore-whitespace ramips.patch
git apply --ignore-space-change --ignore-whitespace common.patch
#git apply --ignore-space-change --ignore-whitespace revert_set_default_root.patch
git apply --ignore-space-change --ignore-whitespace r619ac.patch
cp reset_user_to_root.patch feeds/luci/
cd feeds/luci
git apply -R --ignore-space-change --ignore-whitespace reset_user_to_root.patch 
cd $GITHUB_WORKSPACE/x-wrt/feeds/packages/
cd ../../

exit 0

