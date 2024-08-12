#!/bin/bash
set -e

NEW_GROUPS=(
    # Docker group (required for VSCode containers management)
    "docker"
    # Gaming
    "games"
)

for group in "${NEW_GROUPS[@]}"
do
    sudo gpasswd -a "$(whoami)" "$group"
done
