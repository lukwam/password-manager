#!/bin/bash

IMAGE="password-manager"

docker run -it --rm \
    --expose 8080 \
    -e GOOGLE_APPLICATION_CREDENTAILS="/workspace/etc/service_account.json" \
    -p 8080:8080 \
    -v "$(pwd):/workspace" \
    -w "/workspace" \
    "${IMAGE}"
