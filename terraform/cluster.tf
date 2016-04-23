resource "google_container_cluster" "kube" {
    name = "${var.cluster_name}"
    zone = "${var.cluster_zone}"
    initial_node_count = "${var.cluster.size}"

    master_auth {
        username = "${var.cluster.kube_user}"
        password = "${var.cluster.kube_pass}"
    }

    node_config {
        machine_type = "${var.cluster.machine_type}"
        disk_size_gb = "${var.cluster.disk_size_gb}"
        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_write",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring"
        ]
    }
}

/*
output "kube_client_cert" {
    value = "${google_container_cluster.kube.master_auth.0.client_certificate}"
}
output "kube_client_key" {
    value = "${google_container_cluster.kube.master_auth.0.client_key}"
}
output "kube_ca_cert" {
    value = "${google_container_cluster.kube.master_auth.0.cluster_ca_certificate}"
}
output "kube_endpoint" {
    value = "${google_container_cluster.kube.endpoint}"
}
output "kube_url" {
    value = "${google_container_cluster.kube.instance_group_urls.0}"
}
output "cluster_zone" {
    value = " ${var.cluster.zone}"
}
*/
