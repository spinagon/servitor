#!/bin/bash
PROJECT=$(realpath "$1")
shift
docker run -v "$PROJECT":/git --rm servitor "$@"
