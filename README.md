# Terraform AWS EC2

A basic project that creates an AWS EC2 instance and the security group and key-pair for it.

## Prerequisites

* Install terraform - [instructions](https://www.terraform.io/downloads.html)
* Initialize the projects directory - run `terraform init`

## AWS Authentication

* set credentials in `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables
* use shared credentials file by setting its path in `TF_VAR_aws_cred_file_path`

## Create the resources with Terraform

### Set variables

[Instructions](https://learn.hashicorp.com/terraform/getting-started/variables.html#assigning-variables) on how to set variables in Terraform

Required variables:

* `region` - set the AWS region to work in
* `pub_key_instance_path` - set path to the file containing the public key from which to create the EC2 key pair.
* `instance_type` - set the EC2 instance type

### Manage resources

* Create/update - run `terraform apply`
* Destroy - run `terraform destroy`