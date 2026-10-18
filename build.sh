#!/bin/bash
IMAGE_TAG=${1:-latest}
REPO_NAME=${2:-react-app}
docker build -t ${REPO_NAME}:${IMAGE_TAG} .
