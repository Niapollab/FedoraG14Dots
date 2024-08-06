#!/bin/bash
set -e

if grep -q 'max_parallel_downloads' '/etc/dnf/dnf.conf'; then
    sudo sed 's/max_parallel_downloads=.*/max_parallel_downloads=10/g' -i '/etc/dnf/dnf.conf'
else
    sudo tee -a '/etc/dnf/dnf.conf' > /dev/null <<< "max_parallel_downloads=10"
fi
