#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"
arch=$(dpkg --print-architecture)
tmp=$(mktemp -d)

trap 'rm -rf "$tmp"' EXIT
curl -fsSLo "$tmp/terraform.zip" "https://releases.hashicorp.com/terraform/$VERSION/terraform_${VERSION}_linux_$arch.zip"
unzip -q -o "$tmp/terraform.zip" -d /usr/local/bin
