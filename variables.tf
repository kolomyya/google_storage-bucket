variable "credentials" {
  default = "acount.json"
}

variable "region" {
  default = "us-central1" # Iowa
}

variable "bucket_name" {
  default = "my-bucket"
}  

variable "location" {
  default = "US"
}

variable "storage-class" {
  default = "REGIONAL"
}

variable "bucket_folders" {
  type        = "list"
  description = "The list of bucket folders to create"
  default     = ["Jenkins", "Jira", "Grafana", "Nexus", "Vault"]
}

variable "cpath"  {}  // terraform service acount








#variable "bucket_name" {}
#variable "app_name"  {}
#variable "region" {}
#variable "namespace"  {}
#variable "environment"  {}