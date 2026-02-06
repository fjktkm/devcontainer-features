#!/bin/sh

set -e

VOLUME_ROOT="/mnt/agent-persistence"
if [ -e "${VOLUME_ROOT}" ]; then
    TARGET_USER="$(id -un)"
    TARGET_GROUP="$(id -gn)"
    RUN_AS_ROOT=""
    if [ "$(id -u)" -ne 0 ]; then
        command -v sudo >/dev/null 2>&1 && RUN_AS_ROOT="sudo"
    fi
    if [ -n "${RUN_AS_ROOT}" ] || [ "$(id -u)" -eq 0 ]; then
        ${RUN_AS_ROOT} chown -R "${TARGET_USER}:${TARGET_GROUP}" "${VOLUME_ROOT}" 2>/dev/null || true
        ${RUN_AS_ROOT} chmod -R 777 "${VOLUME_ROOT}" 2>/dev/null || true
        echo "Permissions set: agent-persistence volume"
    else
        echo "Skipped: sudo not available for permission fixes"
    fi
fi

setup_symlink() {
    dest="$1"
    src="${VOLUME_ROOT}/${dest}"
    mkdir -p "$src"
    mkdir -p "$(dirname "$HOME/$dest")"
    [ -e "$HOME/$dest" ] && [ ! -L "$HOME/$dest" ] && rm -rf "$HOME/$dest"
    ln -sf "$src" "$HOME/$dest"
}

if [ "$CLAUDE" = "true" ]; then
    setup_symlink ".claude"
    [ -f "${VOLUME_ROOT}/.claude/.config.json" ] || echo '{}' > "${VOLUME_ROOT}/.claude/.config.json"
    echo "Symlinked: Claude Code"
fi

if [ "$CODEX" = "true" ]; then
    setup_symlink ".codex"
    echo "Symlinked: Codex"
fi

if [ "$GEMINI" = "true" ]; then
    setup_symlink ".gemini"
    setup_symlink ".cache/google-vscode-extension"
    setup_symlink ".cache/cloud-code"
    echo "Symlinked: Gemini Code Assist"
fi

if [ "$GITHUB_CLI" = "true" ]; then
    setup_symlink ".config/gh"
    echo "Symlinked: GitHub CLI"
fi
