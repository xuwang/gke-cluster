##########################################################################################
# Terraform targets for build/destroy K8s and related resources
#
##########################################################################################

MODULES_DIR := modules
TF_DIR := terraform

# Terraform files
TF_ACCOUNT := $(GCP_KEY_FILE)
TF_PORVIDER := $(TF_DIR)/provider.tf
TF_DESTROY_PLAN := $(TF_DIR)/destroy.tfplan
TF_APPLY_PLAN := $(TF_DIR)/apply.tfplan
TF_STATE := $(TF_DIR)/terraform.tfstate

# Terraform commands
TF_GET := terraform get -update
TF_SHOW := terraform show -module-depth=1
TF_GRAPH := terraform graph -draw-cycles -verbose
TF_PLAN := terraform plan -module-depth=1  -var-file override.tfvars
TF_APPLY := terraform apply  -var-file override.tfvars
TF_REFRESH := terraform refresh
TF_DESTROY := terraform destroy -force  -var-file override.tfvars

tfhelp:
	@echo "Terraform usage: make (tfplan | tfapply | tfdestroy | tfshow | tfhelp)"

tfplan: | ${TF_ACCOUNT}
	@cd ${TF_DIR}; ${TF_PLAN}

tfapply: tfplan
	@cd ${TF_DIR}; ${TF_APPLY}
	# tag all notes for firewall rule, but it take long..
	# ${SCRIPTS_DIR}/tag-instances.sh ${CLUSTER_NAME}
	gcloud container clusters get-credentials ${GCP_CLUSTER_NAME}

tfdestroy: | ${TF_ACCOUNT}
	@cd ${TF_DIR}; ${TF_DESTROY}

tfshow:
	@cd ${TF_DIR}; ${TF_SHOW}


.PHONY: tfplan tfapply tfdestroy tfshow help-tf
