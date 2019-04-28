terraform {
  backend "gcs" {
    bucket  = "my_bucket"
    path    = "/terraform.tfstate"
    project = "fuchicopr"
  }
}