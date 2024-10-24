git clone https://github.com/x-wrt/x-wrt


git clone https://github.com/coolsnowwolf/lede lede
lede/scripts/feeds update -a

cd x-wrt

echo "Job name is $GITHUB_JOB"
#git checkout 610ea1b9994 #x-wrt
#git checkout 0a2ed285e4 #openwrt

#if echo $GITHUB_WORKFLOW_REF |grep openwrt
#then

# Linux version 5.4.152 (runner@fv-az1538-855) (gcc version 11.2.0 (OpenWrt GCC 11.2.0 r17755-0eed96ca5d8)) #0 Wed Oct 13 20:55:45 2021
# Powered by LuCI branch (git-21.286.81213-cd11ef6) / OpenWrt SNAPSHOT r17755-0eed96ca5d8

      
# git checkout 424210b #KERNEL 5.15.81
   #git checkout 0eed96ca5d #kernel 5.4.152
     #   0a2ed285e4
#else
        #git checkout 610ea1b9994
#fi


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

wget https://github.com/x-wrt/packages/commit/ad9d5a3eef961dcf2bef0e5486898c823786e53c.patch -O feeds/packages/6.patch
cd $GITHUB_WORKSPACE/x-wrt/feeds/packages/                                                                                                
git apply -R --ignore-space-change 6.patch                                                                                                
cd $GITHUB_WORKSPACE/x-wrt    

rm -rf package/openwrt-packages/luci-app-wechatpush
rm -rf feeds/kenzo/luci-app-wechatpush
sudo mkdir -p /workdir
sudo timedatectl set-timezone "$TZ"
sudo chown $USER:$GROUPS /workdir
mkdir -p ../$DRIVERS_DIR 
ln -sf /workdir/x-wrt $GITHUB_WORKSPACE/x-wrt
#rm -r $GITHUB_WORKSPACE/x-wrt/feeds//luci/applications/luci-app-filebrowser/
