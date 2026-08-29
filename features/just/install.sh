#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"
: "${LSPVERSION:?the 'lspVersion' option is required}"
arch=$(uname -m)

curl -fsSL https://just.systems/install.sh |
bash -s -- --tag "$VERSION" --to /usr/local/bin

curl -fsSL "https://github.com/terror/just-lsp/releases/download/$LSPVERSION/just-lsp-$LSPVERSION-$arch-unknown-linux-gnu.tar.gz" |
tar -xz -C /usr/local/bin --no-same-owner ./just-lsp
