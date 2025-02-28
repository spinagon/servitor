#!/bin/bash
docker rmi -f servitor || true
docker build . -t servitor
