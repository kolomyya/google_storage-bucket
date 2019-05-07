output "folders" {
    value = "${google_storage_bucket_object.folder.*.triggers}"
}