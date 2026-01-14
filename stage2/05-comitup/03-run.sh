#!/bin/bash

set -e

sed -i 's/^# en_US.UTF-8/en_US.UTF-8/' ${ROOTFS_DIR}/etc/locale.gen

on_chroot <<EOF
locale-gen
update-locale LANG=en_US.UTF-8
EOF
