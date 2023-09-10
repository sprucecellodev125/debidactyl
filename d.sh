#!/bin/bash
DEBIAN_RELEASE=bookworm
ARCH=amd64
RELEASE_DATE=$(date +"%Y%m%d")_05:24

if command -v wget &>/dev/null; then
    DOWNLOAD_CMD=wget
elif command -v curl &>/dev/null; then
    DOWNLOAD_CMD=curl -O
else
    echo "Wget or curl isn't installed. Setup cannot continue"
fi

$DOWNLOAD_CMD https://proot.gitlab.io/proot/bin/proot

mkdir .rootfs
cd .rootfs

if command -v xz &>/dev/null; then
    $DOWNLOAD_CMD https://sgp1lxdmirror01.do.letsbuildthe.cloud/images/debian/bookworm/$ARCH/default/$RELEASE_DATE/rootfs.tar.xz
    tar -xf rootfs.tar.xz
else
    echo "xz command is not found. Any Java/Bedrock servers that uses yolks isn't supported yet"
fi

if command -v ls userdata &>/dev/null; then
    echo "Directory userdata already exist"
else
    mkdir userdata
fi

PROOT_OPT="-0 \
-r $HOME/.rootfs \
-b /dev \
-b /sys \
-b /proc \
-b /run/user \
-b /tmp \
-b /home/container/userdata:/root
"

if command -v ls /home/container/installed.properties &>/dev/null;
    echo "Entering Linux shell. You can now type commands (eg. ls)"
    HOME=/root
    proot $PROOT_OPT bash
else
    echo "Entering initial setup. Please wait"
    HOME=/root
    proot $PROOT_OPT apt update
    proot $PROOT_OPT apt -yq upgrade
    proot $PROOT_OPT apt -yq install neofetch nano vim htop build-essential tmate nodejs npm python3-pip openjdk-17-jre-headless
    proot $PROOT_OPT npm i -g pm2
    touch /home/container/installed.properties
    echo "Entering Linux shell. You can now type commands (eg. ls)"
    proot $PROOT_OPT bash
fi