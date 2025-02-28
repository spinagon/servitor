#!/bin/bash
set -euo pipefail
PROJECT=$(realpath "$1")
shift
docker run -v "$PROJECT":/git --rm servitor "$@"
