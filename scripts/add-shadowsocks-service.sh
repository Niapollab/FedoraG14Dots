#!/bin/sh
set -e

tee "$HOME/.config/systemd/user/shadowsocks.service" > /dev/null << EOF
[Unit]
Description=Shadowsocks Client Service
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=sslocal -c "%h/.config/shadowsocks/config.json"

[Install]
WantedBy=default.target
EOF

systemctl --user enable --now shadowsocks.service
