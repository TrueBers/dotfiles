#!/bin/bash
# install must have packages
pacman -S --needed btrfs-progs intel-ucode git htop sudo vim stow haveged pkgfile openssh mc \
	  base-devel \
	  gcc clang make cmake strace lsof

# Entropy source
systemctl enable haveged

# DNS for systemd resolver
systemctl enable systemd-resolved
ls -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf

# Enable NTP sync
timedatectl set-ntp 1

# Pkgfile updates
systemctl enable pkgfile-update.timer

# Enable weekly TRIM
systemctl enable fstrim.timer
