#!/bin/bash
set -e
source dev-container-features-test-lib
check ".config/gh points to dedicated volume" test "$(readlink "$HOME/.config/gh")" = "/mnt/github-cli-persistence-workspace/.config/gh"
check ".config/gh exists" test -d "$HOME/.config/gh"
reportResults
