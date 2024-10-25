git clone https://github.com/x-wrt/x-wrt


git clone https://github.com/coolsnowwolf/lede lede
lede/scripts/feeds update -a

cd x-wrt

echo "Job name is $GITHUB_JOB"
#git checkout 610ea1b9994 #x-wrt
#git checkout 0a2ed285e4 #openwrt

#if echo $GITHUB_WORKFLOW_REF |grep openwrt
#then
      # git checkout 424210b #KERNEL 5.15.81

#git1 checkout 22.03_b202210282250 #5.15.74
#git1 checkout 9.0_b202110300939 #5.4.155

git checkout 22.03_b202210282250 #5.15.74

#git checkout v21.02.7; mv $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs_v21.02.7.patch $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs.patch 
#git checkout v21.02.1 ;mv $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs_v21.02.1.patch $GITHUB_WORKSPACE/patches/600-custom-change-txpower-and-dfs.patch;cp $GITHUB_WORKSPACE/myconfig/config.ramips.v21.02.1 $GITHUB_WORKSPACE/myconfig/config.ramips.2.kernel5.4 ; cp $GITHUB_WORKSPACE/patches/Makefile.ccache.4.2.1 $GITHUB_WORKSPACE/x-wrt/tools/ccache/Makefile 

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


#wget https://github.com/openwrt/openwrt/commit/eeb59f87a18843c541277a6236b4f2b6e41889e9 -O 0.patch
#wget https://github.com/openwrt/openwrt/commit/eb05baff7fb330de43632d638c34ba544f472935.patch -O 1.patch
#wget https://github.com/openwrt/openwrt/commit/7eb6bf1ac9798f07577f7c2e0ef12f622efc6315.patch -O 2.patch
#wget https://github.com/openwrt/openwrt/commit/8766a92766962f7267bf44851aaacd3588249473.patch -O 3.patch
#wget https://github.com/openwrt/openwrt/commit/3e668c6d02ed637620bde27c66c0bdeedf18f54f.patch -O 4.patch
#wget https://github.com/openwrt/openwrt/commit/9cecf2b16e0ea8560e50ef6719938bd80b963704.patch -O 5.patch


#wget https://github.com/openwrt/openwrt/commit/eb05baff7fb330de43632d638c34ba544f472935.patch -O 1.patch
#wget https://github.com/openwrt/openwrt/commit/7eb6bf1ac9798f07577f7c2e0ef12f622efc6315.patch -O 2.patch
#wget https://github.com/openwrt/openwrt/commit/8766a92766962f7267bf44851aaacd3588249473.patch -O 3.patch
#wget https://github.com/openwrt/openwrt/commit/3e668c6d02ed637620bde27c66c0bdeedf18f54f.patch -O 4.patch
#wget https://github.com/openwrt/openwrt/commit/9cecf2b16e0ea8560e50ef6719938bd80b963704.patch -O 5.patch

#git apply -R --ignore-space-change 0.patch
#git apply -R --ignore-space-change 1.patch
#git apply -R --ignore-space-change 2.patch
#git apply -R --ignore-space-change 3.patch
#git apply -R --ignore-space-change 4.patch
#git apply -R --ignore-space-change 5.patch

#cat package/network/services/ppp/Makefile|grep PKG_RELEASE_VERSION:=

#rm target/linux/ramips/dts/mt7620a.dtsi
#rm target/linux/ramips/dts/mt7620n.dtsi
#rm target/linux/ramips/mt7620/target.mk
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620a.dtsi -O target/linux/ramips/dts/mt7620a.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620n.dtsi -O target/linux/ramips/dts/mt7620n.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/mt7620/target.mk -O target/linux/ramips/mt7620/target.mk


ln -s $GITHUB_WORKSPACE/lede/package/lean $GITHUB_WORKSPACE/x-wrt/package/lean
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

#wget https://github.com/x-wrt/packages/commit/ad9d5a3eef961dcf2bef0e5486898c823786e53c.patch -O feeds/packages/6.patch
#cd $GITHUB_WORKSPACE/x-wrt/feeds/packages/                                                                                                
#git apply -R --ignore-space-change 6.patch                                                                                                
cd $GITHUB_WORKSPACE/x-wrt    

rm -rf package/openwrt-packages/luci-app-wechatpush
rm -rf feeds/kenzo/luci-app-wechatpush
sudo mkdir -p /workdir
sudo timedatectl set-timezone "$TZ"
sudo chown $USER:$GROUPS /workdir
mkdir -p ../$DRIVERS_DIR 
ln -sf /workdir/x-wrt $GITHUB_WORKSPACE/x-wrt
#rm -r $GITHUB_WORKSPACE/x-wrt/feeds//luci/applications/luci-app-filebrowser/
