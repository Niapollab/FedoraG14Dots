#!/bin/sh
set -e

USER_SHARE_DIR="/home/portproton"

sudo mkdir -p "$USER_SHARE_DIR"

sudo chown :games "$USER_SHARE_DIR"
sudo chmod -R 770 "$USER_SHARE_DIR"
sudo chmod -R g+s "$USER_SHARE_DIR"

sudo setfacl -R -d -m u::rwx -m g::rwx -m o::0 "$USER_SHARE_DIR"
