#!/bin/bash

# Build Variables
BUILDDIR=$HOME/.build

# Apt Frontent Variable
export DEBIAN_FRONTEND=noninteractive

# Binary Variables
GIT="/usr/bin/git"
MKDIR="/bin/mkdir"
CP="/bin/cp"
SUDO="/usr/bin/sudo"
APT="/usr/bin/apt"
MAKE="/usr/bin/make"
TAR="/bin/tar"
SYSTEMCTL="/bin/systemctl"

# Raspberry Pi 4 Kernel Version
KERNEL=kernel7l

create_build_environment () {
   $MKDIR "$BUILDDIR"
}

clone_config_repo () {
    $GIT clone git@github.com:JPyke3/a2-CPT264.git "$BUILDDIR"/config
}

clone_raspberry_repo () {
    # Install depends
    $SUDO -y $APT install git bc bison flex libssl-dev make
    # Clone Repo
    $GIT clone --depth=1 https://github.com/raspberrypi/linux "$BUILDDIR"/linux 
}

copy_config () {
   $CP "$BUILDDIR"/config/.config "$BUILDDIR"/linux/. 
}

build_kernel () {
    cd "$BUILDDIR"/linux || exit
    $MAKE -j4 zImage modules dtbs
}

backup_boot () {
    $TAR -zcvf "$HOME"/boot_backup.tar.gz /boot
}

install_kernel () {
    $SUDO $MAKE modules_install
    $SUDO $CP arch/arm/boot/dts/*.dtb /boot/
    $SUDO $CP arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
    $SUDO $CP arch/arm/boot/dts/overlays/README /boot/overlays/
    $SUDO $CP arch/arm/boot/zImage /boot/$KERNEL.img
}

reboot_system () {
    $SYSTEMCTL reboot
}

create_build_environment
clone_config_repo
clone_raspberry_repo
copy_config
build_kernel
backup_boot
install_kernel
reboot_system


