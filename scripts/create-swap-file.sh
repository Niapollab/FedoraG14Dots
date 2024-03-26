#!/bin/sh
set -e

MEMORY=`awk '/MemTotal/{print $2}' /proc/meminfo`
FILE_SIZE=$(echo "scale=0;$MEMORY + sqrt($MEMORY / 1024 / 1024) * 1024 * 1024" | bc)

sudo dd if=/dev/zero of=/swapfile bs=1K count=$FILE_SIZE status=progress
sudo chmod 600 /swapfile

sudo mkswap -U clear /swapfile
sudo swapon /swapfile

sudo tee -a /etc/fstab > /dev/null <<< "/swapfile none swap sw 0 0"
