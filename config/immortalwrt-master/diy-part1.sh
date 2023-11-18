#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/immortalwrt/immortalwrt / Branch: master
#========================================================================================================================



# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package.git;main' feeds.conf.default
sed -i '$a src-git other https://github.com/Lienol/openwrt-package.git;other' feeds.conf.default
sed -i '$a src-git PWpackages https://github.com/xiaorouji/openwrt-passwall.git;packages' feeds.conf.default
#src-git PWluci https://github.com/xiaorouji/openwrt-passwall.git;luci  //如果是编译passwall2着不需要否则会加载重复软件包
sed -i '$a src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git' feeds.conf.default
sed -i '$a src-git smallpackages https://github.com/kenzok8/small-package.git' feeds.conf.default

