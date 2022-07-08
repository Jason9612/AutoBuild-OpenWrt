#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/10.10.10.13/g' openwrt/package/base-files/files/bin/config_generate
sed -i 's/192.168.$((addr_offset++)).1/10.10.$((addr_offset++)).13/g' openwrt/package/base-files/files/bin/config_generate 

#2. change the login password
sed -i '/root::0:0:99999:7:::/s/^/#/' /openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i 's/root::0:0:99999:7:::/root:$1$iZM.01X5$xfeRwcqbhN\/60\/2SUPwDc\/:0:0:99999:7:::/g' openwrt/package/base-files/files/etc/shadow

#3. Replace with JerryKuKu’s Argon
rm openwrt/feeds/luci/themes/luci-theme-argon -rf

#4.fix turboacc
sed -i '297s/stop_dnscache/revert_dns/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc
sed -i '298s/revert_dns/stop_dnscache/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc

#5.defaut themes
sed -i 's/Bootstrap/Argon/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/Bootstrap Theme (default)/Bootstrap Theme/g' openwrt/feeds/luci/themes/luci-theme-bootstrap/Makefile
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-material/root/etc/uci-defaults/30_luci-theme-material
sed -i '/set luci.main.mediaurlbase/s/^/#/' openwrt/feeds/luci/themes/luci-theme-netgear/root/etc/uci-defaults/30_luci-theme-netgear
