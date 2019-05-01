provider "google" {
  credentials = "${file("${var.cpath}")}"
  project     = "fuchicopr"
  region      = "${var.region}"
}









#terraform { 
#  backend "google_storage_bucket" {   
#    bucket  = "${var.bucket_name}"   
#    path    = "/terraform.tfstate"  
#   path   = "terraform/state/${terraform.workspace}.tfstate"  
#    project = "my-project-id" 
#  }
#}


#data "terraform_remote_state" "common" {
# backend = "gcs"
#  workspace = "${terraform.workspace}"
#
#  config {
#    project = "app"
#    bucket  = "my-bucket"
#    prefix  = "terraform/state"   
# or key    = "networking/${terraform.workspace}/terraform.tfstate"
#  }
#}
