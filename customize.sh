#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' openwrt/package/base-files/files/bin/config_generate

#3. Replace with JerryKuKu’s Argon
rm openwrt/feeds/luci/themes/luci-theme-argon -rf

#4.fix turboacc
sed -i '308s/stop_dnscache/revert_dns/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc
sed -i '309s/revert_dns/stop_dnscache/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc

#5.defaut themes
sed -i 's/Bootstrap/Argon/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/Bootstrap Theme (default)/Bootstrap Theme/g' openwrt/feeds/luci/themes/luci-theme-bootstrap/Makefile
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-material/root/etc/uci-defaults/30_luci-theme-material
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-netgear/root/etc/uci-defaults/30_luci-theme-netgear
