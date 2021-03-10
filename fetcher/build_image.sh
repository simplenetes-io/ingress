#!/usr/bin/env sh

tag="ingress-fetcher:0.0.2"

podman build -t "${tag}" .
