#!/bin/bash

git config --global --add safe.directory '*'
git clone /git/.git project
cd project/src || exit 1
git switch develop
bash -c "$@"
