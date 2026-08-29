#!/usr/bin/env bash
set -euo pipefail
: "${VERSION:?the 'version' option is required}"

if ! command -v npm > /dev/null; then
    echo "claude: npm not found, install a node feature first" >&2
    exit 1
fi

npm install -g "@anthropic-ai/claude-code@$VERSION"
install -d -o "$_REMOTE_USER" -g "$_REMOTE_USER" -m 0755 "$_REMOTE_USER_HOME/.claude"
npm cache clean --force
