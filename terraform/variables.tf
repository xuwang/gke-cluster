
# Use your own PROJECT ID
variable "project_id" {}

variable "cluster_name" {
    default = "services"
}

variable "cluster_zone" {
    default = "us-central1-a"
}

variable "dns_domain" {
    default = "example.com"
}

variable "dns_zone" {
    default = "example-com"
}

variable "account_file" {
    default = "account.json"
}

variable "region" {
    default = "us-central1"
}

variable "environment" {
    default = "dev"
}

variable "cluster" {
    default {
        size = "3"                      //up to 5 is free: https://cloud.google.com/container-engine/
        machine_type = "n1-standard-1"
        disk_size_gb = "100"
        kube_user = "<master-user>"
        kube_pass = "<super-secret>"
    }
}

variable "disk_size" {
    default {
        gitlab_redis = "20"
        gitlab_db = "50"
        gitlab_data = "100"
        mysql = "50"
    }
}
variable "disk_type" {
    default {
        gitlab_redis = "pd-ssd"
        gitlab_db = "pd-standard"
        gitlab_data = "pd-standard"
        mysql = "pd-standard"
    }
}

variable "gsdata_bucket" { }

/* Available zones
"asia-east1-a"
"asia-east1-b"
"asia-east1-c"
"europe-west1-b"
"europe-west1-c"
"europe-west1-d"
"us-east1-b"
"us-east1-c"
"us-east1-d"
"us-central1-a"
"us-central1-b"
"us-central1-c"
"us-central1-f"
*/