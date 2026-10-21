#!/bin/bash

docker stop react_app_prod 2>/dev/null || true
docker rm react_app_prod 2>/dev/null || true

docker run -d --name react_app_prod -p 80:80 subitcha1998/prod:latest
