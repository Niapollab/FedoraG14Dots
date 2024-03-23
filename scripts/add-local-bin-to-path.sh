#!/bin/sh
set -e

sudo tee /etc/profile.d/local-bin-in-path.sh > /dev/null << EOF
LOCAL_BIN_PATH="\$HOME/.local/bin"
case "\$PATH" in
    *"\$LOCAL_BIN_PATH"* ) true ;;
    * ) PATH="\$PATH:\$LOCAL_BIN_PATH" ;;
esac
EOF
