# Setup

Don't forget to place the file ```account.json``` inside the ```credentials``` dir in the root directory before running which would contain your service ```Account Key```  file.

This contains your authentication required for Terraform to talk to the Google API.

You can get it under
```
Google Cloud Platform -> API Manager -> Credentials -> Create Credentials -> Service account key.
```
For the Key type field chose JSON. Put the downloaded file right were your Terraform config file is and name it ```account.json```.

If you are using the gcs as the backend, you will need to give it the ```Storage Admin``` role for the ```storage.buckets.create``` permission.

# In order to do so we are going to create four files:

```main.tf``` -- contains the definition of what we want to achieve

```variables.tf``` -- contains the variables definition.

```config.tfvars``` -- contains the values for variables.



# Variables

```variables.tf``` holds the definition of the elements that can be configured in your
deployment script.


From now on every time you run a ```terraform``` commands ##{plan|apply|destroy|...}## you will need to provide the required variables. Without further information ```terraform``` will enter an interactive mode requesting each variables one by one at the prompt.

If you do not want to set these values on every run you can create a file called ```config.tfvars```

# Architecture

Now that we know what we want to build and also how we want to parametrize our script we are ready to build the ```main.tf```  The code snippets below are extracted from this file.




# Initialize working directory.

The first command that should be run after writing a new Terraform configuration is the terraform init command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.
```
terraform init
```
# Configure  storage bucket name.

You must modify the Google Cloud Storage bucket name, region,namespace and environment  which is defined as an input variable bucket_name in variables.tf file.


Run command:

```terraform plan -var-file=config.tfvars```   Displays what would be executed

# Deploy the changes.

Run command:

```terraform apply  -var-file=config.tfvars```    Applies the changes

Test the deploy.

When the ```terraform apply``` command completes, use the ```Google Cloud console```, you should see the new ```Google Storage bucket``` created in the ```Google Cloud Project```.

And folder

# Listing Bucket Details

If you want to see information about the bucket itself, use the ```-b``` option. For example:
```
gsutil ls -L -b gs://bucket
```


# One closing note 

Don't forget to tear down your cluster when you are done experimenting with ```terraform destroy``` to avoid a surprise bill at the end of the month :)

Clean up the resources created.

When you have finished, run command:

```terraform destroy -var-file=config.tfvars```     Wipes out what have been created




### Remote Backend

Before starting  let's take a look why should we use remote backend. A whenever you provision infrastructure, Terraform keeps track of resources using a state file. So far, this file has been stored on your local machine, which is not ideal especially if there are more people in the team. A Remote Backend is a remote storage solution used to store the state file. For more information on which types of backend can be used, click here.

For this challenge, we'll use Storage Bucket as a remote backend. Create a file called backend.tf with the following content:

backend.tf
```
provider "google" {
  credentials   = "${file("${var.cpath}")}"
  project       = "${var.project}"
  region        = "us-east1"
}
terraform {
  backend "gcs" {
    bucket  = "bucket_name"
    prefix    = "common_tools/"       #A path to the data you want to upload
    project = "project_name"
  }
}
```

The bucket specified in the bucket key has already been created for you. The prefix is just the name of the state file on Storage bucket (it can be any name). Use us-east as region.

Now that you have a remote backend configured, let's run ```terraform init``` again so Terraform can initialize the backend. If you are wondering what's going to happen with the current state file, Terraform will ask you whether you want to copy the current state file to storage Bucket. Answer yes:

Now whenever you create or modify resources, Terraform will modify the state file on Storage bucket.

# Listing Bucket Details

If you want to see information about the bucket itself, use the -b option. For example:
```
gsutil ls -r gs://bucket_name
```
...

# Good luck to all teams!


