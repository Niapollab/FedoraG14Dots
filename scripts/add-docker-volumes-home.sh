#!/bin/sh
set -e

sudo groupadd dockershare
sudo usermod -a -G dockershare "$(whoami)"

sudo mkdir -p "/home/docker"

sudo chown -R :dockershare "/home/docker"
sudo chmod -R 770 "/home/docker"
sudo chmod -R g+s "/home/docker"

sudo setfacl -d -m u::rwx -m g::rwx -m o::0 "/home/docker"
