provider "gcp" {
  credentials = "${file("account.json")}"
  project     = "my-project-id"
  region      = "${var.region}"
}
terraform { 
  backend "google_storage_bucket" {   
    bucket  = "${var.bucket_name}"   
    path    = "/terraform.tfstate"   
    project = "my-project-id" 
  }
}


#data "terraform_remote_state" "common" {
# backend = "gcs"
#  workspace = "${terraform.workspace}"
#
#  config {
#   project = "app"
#    bucket  = "my-bucket"
#    prefix  = "terraform/state"
#  }
#}