#!/bin/bash
set -e

DOCKER_DATA_DIR="/home/docker"

# Stop service
sudo systemctl stop docker.service docker.socket

# Set new path to the /etc/docker/daemon.json
sudo mkdir -p '/etc/docker'

if [[ ! -f '/etc/docker/daemon.json' ]]; then
    sudo sh -c 'printf "{\n}\n" > /etc/docker/daemon.json'
fi

if grep -q '"data-root"' '/etc/docker/daemon.json'; then
    sudo sed "s#\(\"data-root\"\s*:\s*\"\).*\"#\1$DOCKER_DATA_DIR\"#g" -i '/etc/docker/daemon.json'
else
    sudo sed "s#{#{\n    \"data-root\": \"$DOCKER_DATA_DIR\"#" -i '/etc/docker/daemon.json'
fi

# Copy directory to new location
sudo rsync -aP '/var/lib/docker/' "$DOCKER_DATA_DIR"

# Change the SELinux permissions
sudo chcon -Rt svirt_sandbox_file_t "$DOCKER_DATA_DIR"

# Remove old directory
sudo rm -rf '/var/lib/docker'

# Start service
sudo systemctl start docker.service docker.socket
