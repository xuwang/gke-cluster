#!/bin/bash
#
# expose service to get ingress working
# 
# $1 = <app_name>

APP=$1; shift
APP_PORT=${1:-80}

#kubectl expose deployment ${APP}-deploy --target-port=${APP_PORT} --type=NodePort

NODE=$(kubectl get po -o json  -l app=${APP} | jq -r '.items[0].spec.nodeName' )
NODE_IP=$(kubectl get node -o json ${NODE} | jq -r '.status.addresses[] | select(.type=="ExternalIP") | .address')
NODE_PORT=$(kubectl get svc -o json ${APP}-svc  | jq '.spec.ports[0].nodePort' -r)

echo ${NODE_IP}:${NODE_PORT}

