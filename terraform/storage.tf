resource "google_storage_bucket" "gsdata" {
    name = "${var.gsdata_bucket}"
    force_destroy = "true"
    location = "US"
}
