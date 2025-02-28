#!/bin/bash
set -euo pipefail
git config --global --add safe.directory /git
git clone /git/.git project
cd project/src || exit 1
git switch develop
"$@"
