/*
# Managed DNS Zone should be handled with care becaused it may be already delegated.

resource "google_dns_managed_zone" "zone" {
    name = "${var.dns_zone}"
    dns_name = "${var.dns_domain}"
    description = "${lookup(var.dns_zone, var.environment)} DNS zone"
}


output "dns_name" {
	value = "${google_dns_managed_zone.zone.dns_name}"
}

output "dns_name_servers" {
	value = "${join(",", google_dns_managed_zone.zone.name_servers)}"
}

resource "google_dns_record_set" "frontend" {
    managed_zone =  "${var.dns_zone}"
    name = "frontend.${google_dns_managed_zone.zone.dns_name}"
    type = "A"
    ttl = 300
    #
    #  (Required) The string data for the records in this record set whose meaning depends on the DNS type
    #
    rrdatas = ["${google_compute_instance.frontend.network_interface.0.access_config.0.assigned_nat_ip}"]
}

*/

/*
# For myadmin
resource "google_dns_record_set" "myadmin" {
    managed_zone = "${var.dns_zone}"
    name = "myadmin."${var.dns_zdomain}""
    type = "A"
    ttl = 300
    rrdatas = ["104.197.80.84"]
}
*/