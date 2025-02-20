#!/bin/bash
docker run -v $(realpath "$1"):/git --rm servitor "$2"
