#!/usr/bin/env bash

docker build \
  -f Dockerfile.dev \
  -t quay.io/mechevarria/btwp-keycloak .