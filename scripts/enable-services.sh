#!/bin/sh
set -e

SERVICES=(
    # SSHD
    "sshd.service"
    # supergfxd
    "supergfxd.service"
    # nvidia
    "nvidia-hibernate.service" 
    "nvidia-suspend.service"
    "nvidia-resume.service"
    "nvidia-powerd.service"
)

for service in "${SERVICES[@]}"
do
    sudo systemctl enable --now "$service"
done
