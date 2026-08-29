#!/usr/bin/env bash
set -euo pipefail
here=$(dirname "$0")
snippet=/opt/aws-sso/ps1.sh

install -d -m 0755 /opt/aws-sso
install -m 0644 "$here/ps1.sh" "$snippet"
install -m 0755 "$here/aws-sso" /usr/local/bin/aws-sso
install -d -o "$_REMOTE_USER" -g "$_REMOTE_USER" -m 0755 "$_REMOTE_USER_HOME/.aws"

grep -qF "$snippet" "$_REMOTE_USER_HOME/.bashrc" || printf '\n. %s\n' "$snippet" >> "$_REMOTE_USER_HOME/.bashrc"
