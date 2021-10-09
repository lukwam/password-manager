#!/bin/bash

IMAGE="password-manager"

pack build "${IMAGE}" --builder gcr.io/buildpacks/builder:v1
