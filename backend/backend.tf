provider "google" {
  credentials   = "${file("${var.cpath}")}"
  project       = "${var.project}"
  region        = "us-central1"
}


terraform {
  backend "gcs" {
    bucket  = "fuchicorp_bucket"
    prefix    = "webplatform-fuchicorp-deploy_dev/terraform.tfstate"    #A path to the data you want to upload
    project = "focus-surfer-237100"
  }
}

