# Firewalls for kube ingress health check
resource "google_compute_firewall" "allow-ingress-check" {
    name = "allow-130-211-0-0-22"
    description = "Allow ingress check."
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["30000-65535"]
    }

    source_ranges = ["130.211.0.0/22"]
    // target_tags = ["${var.cluster_name}"]
}