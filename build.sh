#!/bin/bash
docker rmi -f servitor && docker build . -t servitor
