# Label all nodes with role

ROLE=${1:-services}
kubectl get nodes -o json | jq -r '.items[].metadata.name' | xargs -I{} kubectl label node {} role=${ROLE}