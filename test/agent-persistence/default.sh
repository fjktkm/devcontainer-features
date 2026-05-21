#!/bin/bash

set -e

source dev-container-features-test-lib

check "claude symlink points to user volume" bash -c 'readlink "$HOME/.claude" | grep -q agent-persistence-user'
check "codex symlink points to user volume" bash -c 'readlink "$HOME/.codex" | grep -q agent-persistence-user'
check "gemini symlink points to user volume" bash -c 'readlink "$HOME/.gemini" | grep -q agent-persistence-user'
check "gh config symlink points to user volume" bash -c 'readlink "$HOME/.config/gh" | grep -q agent-persistence-user'

reportResults
