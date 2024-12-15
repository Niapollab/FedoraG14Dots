#!/bin/bash
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
    # Syncthing
    "syncthing-resume.service"
    # TuneD
    "tuned.service"
    # Earlyoom
    "earlyoom.service"
)

VIRT_SERVICES=(
    "qemu"
    "interface"
    "network"
    "nodedev"
    "nwfilter"
    "secret"
    "storage"
)

for service in "${SERVICES[@]}"
do
    sudo systemctl enable --now "$service"
done

for service in "${VIRT_SERVICES[@]}"
do
    sudo systemctl enable --now "virt${service}d.service"
    sudo systemctl enable --now "virt${service}d-ro.socket"
    sudo systemctl enable --now "virt${service}d-admin.socket"
done
