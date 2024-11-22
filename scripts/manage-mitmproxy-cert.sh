#!/bin/sh
set -e

case "$1" in
    install)
        sudo trust anchor "$HOME/.mitmproxy/mitmproxy-ca-cert.pem"
        ;;
    remove)
        sudo trust anchor --remove "$HOME/.mitmproxy/mitmproxy-ca-cert.pem"
        ;;
    *)
        echo "Usage: $0 {install|remove}"
        exit 1
esac

sudo update-ca-trust
