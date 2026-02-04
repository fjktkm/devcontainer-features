#!/bin/sh

set -e

TARGET_USER="$(id -un)"
TARGET_GROUP="$(id -gn)"
RUN_AS_ROOT=""
if [ "$(id -u)" -ne 0 ]; then
    command -v sudo >/dev/null 2>&1 && RUN_AS_ROOT="sudo" || {
        echo "Skipped: sudo not available for permission fixes"
        exit 0
    }
fi

setup_symlink() {
    src="$1"
    dest="$2"
    mkdir -p "$(dirname "$HOME/$dest")"
    [ -e "$HOME/$dest" ] && [ ! -L "$HOME/$dest" ] && rm -rf "$HOME/$dest"
    ln -sf "$src" "$HOME/$dest"
    if [ -e "$src" ]; then
        ${RUN_AS_ROOT} chown -R "${TARGET_USER}:${TARGET_GROUP}" "$src" 2>/dev/null || true
        ${RUN_AS_ROOT} chmod -R 777 "$src" 2>/dev/null || true
    fi
}

if [ "$CLAUDE" = "true" ]; then
    setup_symlink "/mnt/claude" ".claude"
    echo "Enabled: Claude Code"
fi

if [ "$CODEX" = "true" ]; then
    setup_symlink "/mnt/codex" ".codex"
    echo "Enabled: Codex"
fi

if [ "$GEMINI" = "true" ]; then
    setup_symlink "/mnt/gemini" ".gemini"
    setup_symlink "/mnt/cache-google-vscode-extension" ".cache/google-vscode-extension"
    setup_symlink "/mnt/cache-cloud-code" ".cache/cloud-code"
    echo "Enabled: Gemini Code Assist"
fi

if [ "$GITHUB_CLI" = "true" ]; then
    setup_symlink "/mnt/gh" ".config/gh"
    echo "Enabled: GitHub CLI"
fi
