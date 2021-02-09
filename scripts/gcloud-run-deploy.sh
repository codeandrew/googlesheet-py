#!/bin/bash

SERVICE=stimulusathletic
IMAGE_URL=gcr.io/ringed-subject-303606/pythonghsheet:4.0.0
REGION=asia-southeast1

OLD_IMAGE=pythongsheet:1.0.0

docker tag $OLD_IMAGE $IMAGE_URL
docker push $IMAGE_URL

gcloud run deploy $SERVICE --image $IMAGE_URL
