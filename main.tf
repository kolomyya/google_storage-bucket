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
    bucket  = "${google_storage_bucket.COLDLINE.name}"
    count = "${length(var.folders)}"

    triggers {
      folders  =  "${element(var.folders, count.index)}"
    }
}













#resource "google_storage_bucket_acl" "fuchicorp_bucket-acl" {
#  bucket = "${google_storage_bucket.fuchicorp_bucket.name}"
#  }


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


#terraform {
#  backend "gcs" {
#    bucket  = "fuchicorp_bucket"
#    prefix    = "test/terraform.tfstate"    #A path to the data you want to upload
#   project = "focus-surfer-237100"
#  }
#}