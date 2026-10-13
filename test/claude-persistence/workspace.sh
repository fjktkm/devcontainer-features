#!/bin/bash
set -e
source dev-container-features-test-lib
check ".claude points to dedicated volume" test "$(readlink "$HOME/.claude")" = "/mnt/claude-persistence-workspace/.claude"
check ".claude exists" test -d "$HOME/.claude"
reportResults
