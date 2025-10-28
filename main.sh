#!/bin/bash
set -euo pipefail
git config --global --add safe.directory /git
git config --global --add safe.directory /git/.git
git clone /git project
cd project/src || exit 1
git switch develop
"$@"
