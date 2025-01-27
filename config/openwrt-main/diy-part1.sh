#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

sed -i 's/^net\.netfilter\.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/' package/kernel/linux/files/sysctl-nf-conntrack.conf
mkdir -p package/network/config/firewall/patches
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/network/config/firewall/patches/100-fullconenat.patch -O package/network/config/firewall/patches/100-fullconenat.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/network/config/firewall/patches/101-bcm-fullconenat.patch -O package/network/config/firewall/patches/101-bcm-fullconenat.patch
wget https://raw.githubusercontent.com/coolsnowwolf/lede/master/package/network/config/firewall/Makefile -O package/network/config/firewall/Makefile


# 创建并写入.vermagic文件
echo "9c242f353867f49a96054ff8c9f2c460" > .vermagic
echo "Git checkout and .vermagic file creation complete."
sed -i -e 's/^\(.\).*vermagic$/\1cp $(TOPDIR)\/.vermagic $(LINUX_DIR)\/.vermagic/' include/kernel-defaults.mk


# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages' feeds.conf.default

# other
# rm -rf package/utils/{ucode,fbtest}

