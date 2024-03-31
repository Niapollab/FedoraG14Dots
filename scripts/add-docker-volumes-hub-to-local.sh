#!/bin/sh
set -e

USER_SHARE_DIR="$HOME/.local/share/docker"

mkdir -p "$USER_SHARE_DIR"

chmod -R 770 "$USER_SHARE_DIR"
chmod -R g+s "$USER_SHARE_DIR"

setfacl -R -d -m u::rwx -m g::rwx -m o::0 "$USER_SHARE_DIR"
