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