#!/bin/bash

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
check "agent-persistence directories created" test -d "$HOME/.claude" -o -d "$HOME/.codex"

# Check that at least one agent directory exists
if [ -d "$HOME/.claude" ]; then
    check "claude directory exists" test -d "$HOME/.claude"
    echo "✓ Claude Code directory mounted"
fi

if [ -d "$HOME/.codex" ]; then
    check "codex directory exists" test -d "$HOME/.codex"
    echo "✓ Codex directory mounted"
fi

# Report result
reportResults
