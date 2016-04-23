#!/bin/bash
export GCP_PROJECT_DIR=$(PWD)
export GCP_ARTIFACTS_DIR=${GCP_PROJECT_DIR}/artififacts
export GCP_GSDATA_DIR=${GCP_ARTIFACTS_DIR}/gsdata
[ -f ${GCP_GSDATA_DIR} ] || mkdir -p ${GCP_GSDATA_DIR}

###################
## Customization ##
###################
# GCP Configuration, i.e. GCP project conf
# See https://cloud.google.com/sdk/gcloud/reference/topic/configurations
export GCP_CONFIGURATION=default
export GCP_KEY_FILE=project.json
export GCP_PROJECT_ID=my-project-2016
export GCP_ZONE=us-central1-a
export GCP_ENVIRONMENT=dev  # one of (dev, stage, prod)
export GCP_DNS_ZONE=<example-com>
export GCP_DNS_DOMAIN=<example.com>
export GCP_CLUSTER_NAME=<cluster_name>
export GCP_GSDATA_BUCKET=${GCP_PROJECT_ID}-gsdata

##########################
## End of customization ##
##########################
