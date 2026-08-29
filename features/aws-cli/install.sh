#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"
arch=$(uname -m)
tmp=$(mktemp -d)

trap 'rm -rf "$tmp"' EXIT
curl -fsSLo "$tmp/awscli.zip" "https://awscli.amazonaws.com/awscli-exe-linux-$arch-$VERSION.zip"
unzip -q "$tmp/awscli.zip" -d "$tmp"
"$tmp/aws/install" --update
