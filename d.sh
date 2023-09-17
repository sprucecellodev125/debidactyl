#!/bin/bash

if command -v wget &>/dev/null; then
    DOWNLOAD_CMD=wget
elif command -v curl &>/dev/null; then
    DOWNLOAD_CMD=curl -O
else
    echo "Wget or curl isn't installed. Setup cannot continue"
fi

if ls /home/container/installed.properties &>/dev/null; then
	true
else
	$DOWNLOAD_CMD https://proot.gitlab.io/proot/bin/proot
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

if ls /home/container/installed.properties &>/dev/null; then
    echo "Entering Linux shell. You can now type commands (eg. ls)"
    HOME=/root
    ./proot $PROOT_OPT bash
else
    echo "Entering initial setup. Please wait ..."
    mkdir -p .rootfs
    cd .rootfs
    $DOWNLOAD_CMD https://media.githubusercontent.com/media/sprucecellodev125/debidactyl/main/rootfs/debian-rootfs.tar
    tar -xf debian-rootfs.tar; rm debian-rootfs.tar
    cd ../; mkdir -p userdata/
    chmod +x proot
    HOME=/root
    ./proot $PROOT_OPT apt update
    ./proot $PROOT_OPT apt -yq upgrade
    ./proot $PROOT_OPT apt -yq install neofetch nano vim htop build-essential tmate nodejs npm python3-pip openjdk-17-jre-headless
    ./proot $PROOT_OPT npm i -g pm2
    touch /home/container/installed.properties
    echo "Entering Linux shell. You can now type commands (eg. ls)"
    ./proot $PROOT_OPT bash
fi