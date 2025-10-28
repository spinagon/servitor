#!/bin/bash
set -euo pipefail
PROJECT=$(realpath "$1")
shift
docker run --ulimit nofile=65536:65536 -v "$PROJECT":/git --rm servitor "$@"
