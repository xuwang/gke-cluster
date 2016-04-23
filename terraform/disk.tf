# Persistent disks for gitlab pods
/*
resource "google_compute_disk" "gitlab_edis" {
    name = "gitlab-redis-pd"
    zone = "${var.cluster_zone}"
    type = "${var.disk_type.gitlab_redis}"
    size = "${var.disk_size.gitlab_redis}"
}

resource "google_compute_disk" "gitlab_db" {
    name = "gitlab-db-pd"
    zone = "${var.cluster_zone}"
    type = "${var.disk_type.gitlab_db}"
    size = "${var.disk_size.gitlab_db}"
}

resource "google_compute_disk" "gitlab_data" {
    name = "gitlab-data-pd"
    zone = "${var.cluster_zone}"
    type = "${var.disk_type.gitlab_data}"
    size = "${var.disk_size.gitlab_data}"
}
resource "google_compute_disk" "mysql" {
    name = "mysql-pd"
    zone = "${var.cluster_zone}"
    type = "${var.disk_type.mysql}"
    size = "${var.disk_size.mysql}"
}
*/