# Create A Google GKE Cluster with Terraform

This project will provision a [GKE Cluster](https://cloud.google.com/container-engine/). 
## Prerequisites

1. **[Config Google Cloud SDK](https://github.com/xuwang/gcp-config.git)**

## Build the GKE Cluster:

Edit env.sh and validate all the env values for the project.

Edit terraform/override.tfvars to override the default values of claster vars defined in variable.tf.

```
$ source env.sh
$ make
$ make kube-info
```

## To Teardwon

```
$ make destroy
```
