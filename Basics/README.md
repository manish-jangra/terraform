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

    or if you have configured AWS Profiles using `aws configure`, use the following command -
    export AWS_PROFIE="aws_profile_name"
    ```