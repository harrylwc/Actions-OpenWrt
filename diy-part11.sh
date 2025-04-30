#git clone https://github.com/x-wrt/x-wrt


git clone https://github.com/coolsnowwolf/lede x-wrt

sudo cp copy_file.sh /usr/bin
cp copy_file.sh x-wrt/
cd x-wrt


echo "Job name is $GITHUB_JOB"
#git checkout 610ea1b9994 #x-wrt
#git checkout 0a2ed285e4 #openwrt

#if echo $GITHUB_WORKFLOW_REF |grep openwrt
#then
      # git checkout 424210b #KERNEL 5.15.81

#git1 checkout 22.03_b202210282250 #5.15.74
#git1 checkout 9.0_b202110300939 #5.4.155

#git checkout 9.0_b202110300939 #5.4.155

#git checkout v21.02.7 ; cp $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs_kernel_v21.02.7.patch $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs_kernel5.4.patch
#git checkout v21.02.1 # 5.4.154;cp $GITHUB_WORKSPACE/myconfig/config.ramips.v21.02.1 $GITHUB_WORKSPACE/myconfig/config.ramips.2.kernel5.4
#git checkout 0eed96ca5d8 
#cp $GITHUB_WORKSPACE/myconfig/config.ramips.2.kernel5.4 $GITHUB_WORKSPACE/myconfig/config.ramips.2.openwrt
#cp $GITHUB_WORKSPACE/myconfig/config.ramips.2.kernel5.4 x-wrt/.config


#git checkout 0eed96ca5d #kernel 5.4.152
     #   0a2ed285e4
#else
        #git checkout 610ea1b9994
#fi

#cd feeds;mv luci luci.bak;git clone https://github.com/x-wrt/luci
#cd luci; git checkout ea0e494;cd $GITHUB_WORKSPACE/x-wrt/ 


cat package/network/services/ppp/Makefile|grep PKG_RELEASE_VERSION:=
#rm target/linux/ramips/dts/mt7620a.dtsi
#rm target/linux/ramips/dts/mt7620n.dtsi
#rm target/linux/ramips/mt7620/target.mk
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620a.dtsi -O target/linux/ramips/dts/mt7620a.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620n.dtsi -O target/linux/ramips/dts/mt7620n.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/mt7620/target.mk -O target/linux/ramips/mt7620/target.mk


git clone https://github.com/kenzok8/openwrt-packages.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/openwrt-packages
git clone https://github.com/kenzok8/small.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/small


sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git pull
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
git clone https://github.com/muink/luci-app-netspeedtest.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/luci-app-netspeedtest

#rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds -name *filebrowser*`
#rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package -name *filebrowser*`
./scripts/feeds update -a

rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds -name *filebrowser*`
rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package -name *filebrowser*`
rm -rf  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/luci/applications/luci-app-filebrowser

git clone https://github.com/xiaozhuai/luci-app-filebrowser  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/luci/applications/luci-app-filebrowser
./scripts/feeds install -a -f


rm -rf  $GITHUB_WORKSPACE/x-wrt/feeds/luci/applications/luci-app-shadowsocks-libev/                                                       
cp -r $GITHUB_WORKSPACE/package/luci-app-shadowsocks-libev $GITHUB_WORKSPACE/x-wrt/feeds/luci/applications/        

./scripts/feeds update -a  
./scripts/feeds install -a -f  

#cd x-wrt/feeds;mv luci luci.bak;git clone https://github.com/x-wrt/luci
#cd luci; git checkout ea0e494;cd $GITHUB_WORKSPACE/x-wrt/


cd $GITHUB_WORKSPACE/x-wrt    

rm -rf package/openwrt-packages/luci-app-wechatpush
rm -rf feeds/kenzo/luci-app-wechatpush
sudo mkdir -p /workdir
sudo timedatectl set-timezone "$TZ"
sudo chown $USER:$GROUPS /workdir
mkdir -p ../$DRIVERS_DIR 
ln -sf /workdir/x-wrt $GITHUB_WORKSPACE/x-wrt

cd $GITHUB_WORKSPACE/x-wrt/feeds/packages/                                                                                                                                              
                                                                                                                                                                                        

