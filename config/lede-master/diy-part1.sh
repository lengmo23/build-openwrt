#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git PWpackages https://github.com/xiaorouji/openwrt-passwall.git' feeds.conf.default
sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' feeds.conf.default
sed -i '$a src-git smallpackages https://github.com/kenzok8/small-package.git' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

