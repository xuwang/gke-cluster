#!/bin/bash

# de-register zone name

TRAN_FILE=/tmp/transaction.yaml
ZONE=$1  # e.g. example-com
NAME=$2 # e.g. myadmin.example.com

echo DNS de-register zone=${ZONE} name=${NAME}
REC=$(gcloud dns record-sets list -z ${ZONE}  --format json | jq '.[] | select(.name == "'"$NAME"'")')

if [[ -z "${REC}" ]] ; then echo No dns record for \"$NAME\" Nothing to dereg.; exit; fi

IP=$(echo ${REC} | jq -r '.rrdatas[0]')
TTL=$(echo ${REC} | jq -r '.ttl')
TYPE=$(echo ${REC} | jq -r '.type')

gcloud dns record-sets transaction start --zone ${ZONE} --transaction-file ${TRAN_FILE}
gcloud dns record-sets transaction remove --zone ${ZONE} --transaction-file ${TRAN_FILE} --name ${NAME} --ttl ${TTL} --type ${TYPE} ${IP}
#gcloud dns record-sets transaction describe -z ${ZONE} --transaction-file ${TRAN_FILE}
gcloud dns record-sets transaction execute -z ${ZONE} --transaction-file ${TRAN_FILE}
#gcloud dns record-sets list -z ${ZONE}
if [ -f ${TRAN_FILE} ] ; then rm -f ${TRAN_FILE} ; fi