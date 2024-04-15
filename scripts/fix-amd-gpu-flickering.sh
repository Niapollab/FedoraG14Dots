#!/bin/sh
set -e

sudo sed 's#GRUB_CMDLINE_LINUX=\s*\"\(.*\)\"#GRUB_CMDLINE_LINUX="\1 amdgpu.dcdebugmask=0x10"#g' -i '/etc/default/grub'

sudo grub2-mkconfig -o '/boot/grub2/grub.cfg'
