#!/bin/sh
set -e

# Kernel >=6.12.4 breaks Virtualbox
# See: https://forums.fedoraforum.org/showthread.php?333818-Kernel-6-12-4-breaks-Virtualbox&p=1889193

sudo sed 's#GRUB_CMDLINE_LINUX=\s*\"\(.*\)\"#GRUB_CMDLINE_LINUX="\1 kvm.enable_virt_at_load=0"#g' -i '/etc/default/grub'

sudo grub2-mkconfig -o '/boot/grub2/grub.cfg'
