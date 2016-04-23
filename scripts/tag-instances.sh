# tag all instances with role

TAG=$1; shift

gcloud compute instances list --format json \
	| jq -r '.[].name' \
	| xargs -I{} gcloud compute instances add-tags {} --tags ${TAG}
