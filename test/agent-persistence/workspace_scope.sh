#!/bin/bash

set -e

source dev-container-features-test-lib

check "claude symlink points to workspace volume" bash -c 'readlink "$HOME/.claude" | grep -q agent-persistence-workspace'
check "codex symlink points to workspace volume" bash -c 'readlink "$HOME/.codex" | grep -q agent-persistence-workspace'
check "gemini symlink points to workspace volume" bash -c 'readlink "$HOME/.gemini" | grep -q agent-persistence-workspace'

reportResults
