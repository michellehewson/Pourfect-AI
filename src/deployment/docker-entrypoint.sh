#!/bin/bash

echo "Deployment container is running!!!"

# Authenticate gcloud using service account
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
# Set GCP Project Details
gcloud config set project $GCP_PROJECT
# Configure GCR 
gcloud auth configure-docker gcr.io -q

args="$@"
echo $args

if [[ -z ${args} ]]; 
then
    #/bin/bash
    pipenv shell
else
  #/bin/bash $args
  pipenv run $args
fi