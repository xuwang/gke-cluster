#!/bin/bash

# ENV Vars should be set in Makefile

# mkdir -p ${KUBE_ARTIFACTS_DIR}
# terraform output kube_client_cert > $KUBE_CLIENT_CERT
# terraform output kube_client_key > $KUBE_CLIENT_KEY
# terraform output kube_ca_cert > $KUBE_CA_CERT

#kubectl config set-credentials "$CLUSTER_NAME" \
#   --client-certificate="$KUBE_CLIENT_CERT" \
#   --client-key="$KUBE_CLIENT_KEY" \
#   --certificate-authority="$KUBE_CA_CERT" \
#   --cluster="$CLUSTER_NAME"

# or this single line equals above 
gcloud container clusters get-credentials $CLUSTER_NAME

kubectl cluster-info

