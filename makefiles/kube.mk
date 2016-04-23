KUBE_DIR := kube

help-kube:
	@echo "Kubectl usage: make [ config-kube | help-kube | info-cluster | inof-pods | info-svc | info-ing | info-deploy | info-rc ]"

config-kube: 
	gcloud container clusters get-credentials ${GCP_CLUSTER_NAME}

info-kube: info-cluster inof-pods info-svc info-ing

info-cluster:
	kubectl cluster-info
inof-pod:
	kubectl get pods
info-svc:
	kubectl get svc
info-deploy:
	kubectl get deployments
info-ing:
	kubectl get ing
info-rc:
	kubectl get rc,rs


.PHONY: config-kube info-kube info-cluster inof-pods info-svc info-ing info-deploy info-rc