# Sample Terraform Provider Definition
terraform {
  required_version = "~> 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # Backend Configuration helps us store the tfstate file in a remote location and makes team collaboration much easier.
  backend "s3" {
    bucket         = "s3_bucket_name"
    key            = "tfstate_file_name"                     # Name of the file to store terraform state file data
    region         = "us-east-1"
    profile        = ""
    dynamodb_table = "dynamodb_table_name"                  # DynamoDB Table Support TFSTATE Locking feature along with S3 Bucket
  }
}
provider "aws" {
  profile = ""
  region  = "us-east-1"
}