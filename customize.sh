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

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$bs23GriY$BmzvWrakSgCL/4U6ffYo91/g' openwrt/package/lean/default-settings/files/zzz-default-settings

#3. Replace with JerryKuKu’s Argon
rm openwrt/feeds/luci/themes/luci-theme-argon -rf

#4.fix turboacc
sed -i '297s/stop_dnscache/revert_dns/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc
sed -i '298s/revert_dns/stop_dnscache/g' openwrt/feeds/luci/applications/luci-app-turboacc/root/etc/init.d/turboacc

#5.defaut themes
sed -i 's/Bootstrap/Argon/g' openwrt/feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/feeds/luci/collections/luci/Makefile
