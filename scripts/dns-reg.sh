#!/bin/bash

# register zone name ip

TRAN_FILE=/tmp/transaction.yaml
ZONE=$1  # e.g. example-zone
NAME=$2 
IP=$3
echo DNS register zone=${ZONE} name=${NAME} ip=${IP}
gcloud dns record-sets transaction start --zone ${ZONE} --transaction-file ${TRAN_FILE}
gcloud dns record-sets transaction add -z ${ZONE} --transaction-file ${TRAN_FILE} --name ${NAME} --ttl 60 --type A ${IP}
gcloud dns record-sets transaction describe -z ${ZONE} --transaction-file ${TRAN_FILE}
gcloud dns record-sets transaction execute -z ${ZONE} --transaction-file ${TRAN_FILE}
if [ -f ${TRAN_FILE} ] ; then rm -f ${TRAN_FILE} ; fi