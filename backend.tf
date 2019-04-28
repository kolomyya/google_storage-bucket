terraform {
  backend "google" {
    bucket  = "${var.bucket_name}"
    path    = "/terraform.tfstate"
    project = "fuchicopr"
  }
}