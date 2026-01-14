#!/bin/bash

set -e

for conn in dhcp static; do
    install -m 600 files/${conn}.nmconnection ${ROOTFS_DIR}/etc/NetworkManager/system-connections/
done

install -m 755 files/set_comitup_hostname_once "${ROOTFS_DIR}/etc/init.d/"

install -m 644 files/wifi-on.service "${ROOTFS_DIR}/etc/systemd/system/"

on_chroot <<EOF
systemctl enable set_comitup_hostname_once
systemctl enable wifi-on.service
systemctl enable NetworkManager.service
EOF
