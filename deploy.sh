#!/bin/bash
docker stop react_app_prod || true
docker rm react_app_prod || true
docker-compose up -d --build
