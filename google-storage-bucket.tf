resource "google_storage_bucket" "bucket" {
  name = "${var.bucket_name}"
  location = "${var.region}"
  storage_class = "REGIONAL"

  project = "fuchicopr"
}


resource "google_storage_bucket_object" "content_folder" {
  name          = "empty_directory/"
  content       = "Not really a directory, but it's empty."
  bucket        = "${google_storage_bucket.storage_bucket.name}"
}