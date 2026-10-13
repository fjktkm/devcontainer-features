#!/bin/bash
set -e
source dev-container-features-test-lib
check ".gemini points to dedicated volume" test "$(readlink "$HOME/.gemini")" = "/mnt/gemini-persistence-user/.gemini"
check ".gemini exists" test -d "$HOME/.gemini"
check ".cache/google-vscode-extension points to dedicated volume" test "$(readlink "$HOME/.cache/google-vscode-extension")" = "/mnt/gemini-persistence-user/.cache/google-vscode-extension"
check ".cache/google-vscode-extension exists" test -d "$HOME/.cache/google-vscode-extension"
check ".cache/cloud-code points to dedicated volume" test "$(readlink "$HOME/.cache/cloud-code")" = "/mnt/gemini-persistence-user/.cache/cloud-code"
check ".cache/cloud-code exists" test -d "$HOME/.cache/cloud-code"
reportResults
