#!/bin/bash

TYPE=$1    # svc or ing
APP=$2

while [ -z ${IP} ] || [ ${IP} == 'null' ]
do
	IP=$(kubectl get ${TYPE} ${APP}-${TYPE} -o json | jq -r '.status.loadBalancer.ingress[0].ip')
	sleep 2
done

echo ${IP}