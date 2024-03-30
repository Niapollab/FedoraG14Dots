#!/bin/sh
set -e

sudo sed 's#GRUB_CMDLINE_LINUX=\s*\"\(.*\)\"#GRUB_CMDLINE_LINUX="\1 iommu=pt"#g' -i '/etc/default/grub'

sudo grub2-mkconfig -o '/boot/grub2/grub.cfg'
