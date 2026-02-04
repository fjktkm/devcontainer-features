#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Script must be run as root."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="/usr/local/share/agent-creds"

mkdir -p "${INSTALL_DIR}"
cp "${SCRIPT_DIR}/post-start.sh" "${INSTALL_DIR}/post-start.sh"
chmod +x "${INSTALL_DIR}/post-start.sh"

cat > "${INSTALL_DIR}/env" <<EOF
export CLAUDE="${CLAUDE:-true}"
export CODEX="${CODEX:-true}"
export GEMINI="${GEMINI:-true}"
export GITHUB_CLI="${GITHUB_CLI:-true}"
EOF
