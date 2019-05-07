provider "google" {
  credentials   = "${file("${var.cpath}")}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.project}"
  region        = "${var.region}"
}

resource "google_storage_bucket" "COLDLINE" {

  name   = "fuchicorp_bucket"
  storage_class = "COLDLINE" 
  location = "us-central1"
}

resource "google_storage_bucket_object" "folder" {
  name = "test"
  content = "Hello World"
  bucket  = "${google_storage_bucket.COLDLINE.name}"
}


#terraform {
#  backend "gcs" {
#    bucket  = "fuchicorp_bucket"
#    prefix    = "test/terraform.tfstate"    #A path to the data you want to upload
#   project = "focus-surfer-237100"
#  }
#}

#role_entity = [
#    "${compact(var.role_entity)}",
#  ]
#}
#
#variable "role_entity" {
#  description = "List of role/entity pairs in the form ROLE:entity."
# type        = "list"
#  default     = []
#}
