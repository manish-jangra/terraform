We're using AWS Cloud Provider and will take advantage of environment variables for authenticating to AWS.

Environment Variables for AWS Authentication
1. **AWS_ACCESS_KEY_ID** && **AWS_SECRET_ACCESS_KEY**
2. **AWS_PROFILE**

There are various other methods to authenticate to AWS. You can refer to this link https://registry.terraform.io/providers/hashicorp/aws/latest/docs to read more about AWS Authentication.

### Sample Terraform Script to create an EC2 Instance
```TF
provider "aws" {
  region     = ""
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}
```
Setup the following environment variables before running the terraform script
```BASH
    export AWS_REGION="aws_region_name"
    export AWS_ACCESS_KEY_ID="aws_access_key"
    export AWS_SECRET_ACCESS_KEY="aws_secret_key"

    # If you have configured AWS Profiles using `aws configure`, use the following command -
    export AWS_PROFIE="aws_profile_name"
```

From Terraform 0.13 and onwards, we need to configure it like below --

```TF
# Terraform block provides us the list of providers (such as aws, azure, google cloud etc) and their respective versions.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```

Some useful terraform commands --
```BASH
terraform fmt           # Fixes the formatting, I love this command
terraform validate
terraform plan
terraform apply
terraform destroy
# We can also use -auto-approve option to avoid the prompt
```

Destroy a specific resource provisioned by terraform
```BASH
terraform destroy -target aws_instance.my_ec2_instance
```
The `terraform show` command is used to provide human-readable output from a state or plan file

We can override variable values defined in `variables.tf` by declaring them `terraform.tfvars`

Example

```TF
/*
This is variables.tf
*/
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
```

```TF
/*
This is terraform.tfvars
*/
vpc_cidr = "192.168.100.0/22"
```
We don't need to use keyword `variable` in `terraform.tfvars` file.

Questions:
1. How to update the state file for a resource created by terraform but modified outside terraform?