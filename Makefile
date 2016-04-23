# Following ENV must be defined before make \
GCP_PROJECT_DIR=<project directory> \
GCP_CONFIGURATION=<configuration, e.g. default> \
GCP_KEY_FILE=<service_account_key.json> \
GCP_PROJECT_ID=<project_id>	\
GCP_ZONE=<gcp-zone>	\
GCP_ENVIRONMENT=<dev|stage|prod> \
GCP_DNS_ZONE=<dns-zone, e.g. somdev> \
GCP_DNS_DOMAIN=<example.com.> \
GCP_CLUSTER_NAME=<cluster_name>	 \
GCP_GSDATA_BUCKET=${GCP_PROJECT_ID}-gsdata \
See env.sh


TF_VAR_account_file := ${GCP_KEY_FILE}
TF_VAR_cluster_zone := ${GCP_ZONE}
TF_VAR_cluster_name := ${GCP_CLUSTER_NAME}
TF_VAR_environment := ${GCP_ENVIRONMENT}
TF_VAR_project_id := ${GCP_PROJECT_ID}
TF_VAR_dns_zone := ${GCP_DNS_ZONE}
TF_VAR_dns_domain := ${GCP_DNS_DOMAIN}
TF_VAR_gsdata_bucket := ${GCP_GSDATA_BUCKET}

export

all: cluster
	
cluster: tfapply info-kube
	
config-sdk:
	$(MAKE) -C ${GCP_PROJECT_DIR}/gcp-config

destroy: tfdestroy

info: info-kube

help:
	@echo "make [ all | cluster | config-sdk | destroy | help | info | upload-gsdata ]"

upload-gsdata:
	gsutil -m rsync -d -r ${GCP_GS_DIR} gs://${GCP_GSDATA_BUCKET}

include makefiles/*.mk

.PHONY: all cluster config-sdk destroy help info upload-gsdata