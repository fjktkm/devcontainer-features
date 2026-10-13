#!/bin/bash
set -e
source dev-container-features-test-lib
check ".codex points to dedicated volume" test "$(readlink "$HOME/.codex")" = "/mnt/codex-persistence-workspace/.codex"
check ".codex exists" test -d "$HOME/.codex"
reportResults
