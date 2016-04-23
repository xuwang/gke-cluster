# Configure the Google Cloud provider
provider "google" {
    credentials = "${file("${var.account_file}")}"
    project = "${var.project_id}"
    region = "${var.region}"
}