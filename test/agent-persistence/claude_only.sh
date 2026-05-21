#!/bin/bash

set -e

source dev-container-features-test-lib

check "claude directory is symlink" test -L "$HOME/.claude"
check "codex directory not mounted" test ! -L "$HOME/.codex"
check "gemini directory not mounted" test ! -L "$HOME/.gemini"

reportResults
