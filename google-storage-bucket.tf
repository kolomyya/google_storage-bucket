resource "google_storage_bucket" "bucket" {
  name = "${var.bucket_name}"
  location = "${var.region}"
  storage_class = "REGIONAL"

  tags  {
    source      = "../"
    name        = "${var.app_name}"
    namespace   = "${var.namespace}"
    environment = "${var.environment}"
   }
}

