resource "google_storage_bucket" "bucket" {
  name = "${var.bucket_name}"
  location = "${var.region}"
  storage_class = "REGIONAL"

  project = "fuchicopr"
}


resource "google_storage_bucket_object" "folders" {
  count  =  "${lenght($"{var.bucket_folders}")}"
  key    =  "${var.bucket_folders[count.index]}/"
  bucket        = "${google_storage_bucket.("${bucket_name"})}"
}