resource "google_storage_bucket" "bucket" {
name = "${var.bucket_name}"
location = "${var.region}"
storage_class = "REGIONAL"
}


module "label" {
  source      = "../"
  namespace   = "${var.namespace}"
  environment = "${var.environment}"
}