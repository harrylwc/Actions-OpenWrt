git clone https://github.com/x-wrt/x-wrt
git clone https://github.com/coolsnowwolf/lede lede
lede/scripts/feeds update -a

cd x-wrt
#rm target/linux/ramips/dts/mt7620a.dtsi
#rm target/linux/ramips/dts/mt7620n.dtsi
#rm target/linux/ramips/mt7620/target.mk
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620a.dtsi -O target/linux/ramips/dts/mt7620a.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620n.dtsi -O target/linux/ramips/dts/mt7620n.dtsi
#wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/mt7620/target.mk -O target/linux/ramips/mt7620/target.mk


ln -s $GITHUB_WORKSPACE/lede/package/lean $GITHUB_WORKSPACE/x-wrt/package/lean
git clone https://github.com/kenzok8/openwrt-packages.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/openwrt-packages
git clone https://github.com/kenzok8/small.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/small


sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.defaulto
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git pull
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds -name *filebrowser*`
#rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package -name *filebrowser*`
./scripts/feeds update -a

rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds -name *filebrowser*`
rm -rf `find  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package -name *filebrowser*`
rm -rf  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/luci/applications/luci-app-filebrowser
git clone https://github.com/xiaozhuai/luci-app-filebrowser  /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/feeds/luci/applications/luci-app-filebrowser
./scripts/feeds install -a -f

rm -rf package/openwrt-packages/luci-app-wechatpush
rm -rf feeds/kenzo/luci-app-wechatpush
sudo mkdir -p /workdir
sudo timedatectl set-timezone "$TZ"
sudo chown $USER:$GROUPS /workdir
mkdir -p ../$DRIVERS_DIR 
ln -sf /workdir/x-wrt $GITHUB_WORKSPACE/x-wrt
#rm -r $GITHUB_WORKSPACE/x-wrt/feeds//luci/applications/luci-app-filebrowser/
