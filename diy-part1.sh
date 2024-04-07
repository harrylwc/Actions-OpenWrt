#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
git clone https://github.com/x-wrt/x-wrt
git clone https://github.com/openwrt/openwrt x-wrt
git clone https://github.com/coolsnowwolf/lede lede
lede/scripts/feeds update -a

#rm -r x-wrt/package/lean/n2n*
cd x-wrt
#SUB='mt7620'
#if [[ "$KERNEL_CONFIG_DIR" == *"$SUB"* ]]; then
#  echo "mt7620 found."
#  git checkout 4e623c4
#fi
rm target/linux/ramips/dts/mt7620a.dtsi
rm target/linux/ramips/dts/mt7620n.dtsi
rm target/linux/ramips/mt7620/target.mk
wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620a.dtsi -O target/linux/ramips/dts/mt7620a.dtsi
wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/dts/mt7620n.dtsi -O target/linux/ramips/dts/mt7620n.dtsi
wget https://raw.githubusercontent.com/openwrt/openwrt/main/target/linux/ramips/mt7620/target.mk -O target/linux/ramips/mt7620/target.mk


ln -s $GITHUB_WORKSPACE/lede/package/lean $GITHUB_WORKSPACE/x-wrt/package/lean
git clone https://github.com/kenzok8/openwrt-packages.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/openwrt-packages
git clone https://github.com/kenzok8/small.git /home/runner/work/Actions-OpenWrt/Actions-OpenWrt/x-wrt/package/small


sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
git pull
#git reset --hard 22.10_b202303121313
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#git checkout 90d9cb4
#git checkout 7832be9
#git checkout 166ab6f90eef9e08b1d5f45fe5464ecd2194b2e3 
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.15/g' target/linux/ipq40xx/Makefile
./scripts/feeds update -a
./scripts/feeds install -f -a
rm -rf package/openwrt-packages/luci-app-wechatpush
rm -rf feeds/kenzo/luci-app-wechatpush
sudo mkdir -p /workdir
sudo timedatectl set-timezone "$TZ"
sudo chown $USER:$GROUPS /workdir
mkdir -p ../$DRIVERS_DIR 
ln -sf /workdir/x-wrt $GITHUB_WORKSPACE/x-wrt
