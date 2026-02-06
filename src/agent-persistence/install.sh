#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "Script must be run as root."
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="/usr/local/share/agent-persistence"

mkdir -p "${INSTALL_DIR}"

cp "${SCRIPT_DIR}/oncreate.sh" "${INSTALL_DIR}/oncreate.sh"
cp "${SCRIPT_DIR}/poststart.sh" "${INSTALL_DIR}/poststart.sh"
chmod +x "${INSTALL_DIR}/oncreate.sh"
chmod +x "${INSTALL_DIR}/poststart.sh"

cat > "${INSTALL_DIR}/env" <<EOF
export CLAUDE="${CLAUDE:-true}"
export CODEX="${CODEX:-true}"
export GEMINI="${GEMINI:-true}"
export GITHUB_CLI="${GITHUB_CLI:-true}"
EOF
