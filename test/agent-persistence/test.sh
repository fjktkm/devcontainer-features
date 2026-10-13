#!/bin/bash
set -e
source dev-container-features-test-lib
check ".codex uses codex volume" test "$(readlink "$HOME/.codex")" = "/mnt/codex-persistence-user/.codex"
check ".claude uses claude volume" test "$(readlink "$HOME/.claude")" = "/mnt/claude-persistence-user/.claude"
check ".gemini uses gemini volume" test "$(readlink "$HOME/.gemini")" = "/mnt/gemini-persistence-user/.gemini"
check ".cache/google-vscode-extension uses gemini volume" test "$(readlink "$HOME/.cache/google-vscode-extension")" = "/mnt/gemini-persistence-user/.cache/google-vscode-extension"
check ".cache/cloud-code uses gemini volume" test "$(readlink "$HOME/.cache/cloud-code")" = "/mnt/gemini-persistence-user/.cache/cloud-code"
check ".config/gh uses github-cli volume" test "$(readlink "$HOME/.config/gh")" = "/mnt/github-cli-persistence-user/.config/gh"
reportResults
