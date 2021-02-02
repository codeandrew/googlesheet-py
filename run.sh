#!/bin/bash
IMAGE=pythongsheet:1.0.0

docker build -t $IMAGE  .
docker run -p 8080:8080 $IMAGE 