#!/bin/bash

git config --global --add safe.directory '*'
git clone /git/.git project
cd project/src
git switch develop
make "$1"
