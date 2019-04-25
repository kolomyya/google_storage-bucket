# terraform-google-storage-bucket

Initialize working directory.

The first command that should be run after writing a new Terraform configuration is the terraform init command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.

terraform init
Configure S3 bucket name.

You must modify the Google Cloud Storage bucket name, which is defined as an input variable bucket_name in variables.tf file.


Run command:

terraform plan
Deploy the changes.

Run command:

terraform apply
Test the deploy.

When the terraform apply command completes, use the Google Cloud console, you should see the new Google Storage bucket created in the Google Cloud Project.

Clean up the resources created.

When you have finished, run command:

terraform destroy