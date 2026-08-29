#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"

curl -fsSL https://just.systems/install.sh |
bash -s -- --tag "$VERSION" --to /usr/local/bin
