#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"
arch=$(dpkg --print-architecture)

curl -fsSL "https://nodejs.org/dist/v$VERSION/node-v$VERSION-linux-${arch/amd64/x64}.tar.xz" |
tar -xJ -C /usr/local --strip-components=1 --no-same-owner --exclude=CHANGELOG.md --exclude=LICENSE --exclude=README.md
