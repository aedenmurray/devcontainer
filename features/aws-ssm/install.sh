#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"
arch=$(dpkg --print-architecture)
tmp=$(mktemp -d)

trap 'rm -rf "$tmp"' EXIT
curl -fsSLo "$tmp/session-manager-plugin.deb" "https://s3.amazonaws.com/session-manager-downloads/plugin/$VERSION/ubuntu_${arch/amd64/64bit}/session-manager-plugin.deb"
DEBIAN_FRONTEND=noninteractive dpkg -i "$tmp/session-manager-plugin.deb"
