# Provider Default
provider "aws" {
  region  = "us-east-1"
}

# Provider AWS West-2
provider "aws" {
  alias = "west-2"
  region  = "us-west-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    # Bucket S3 to Terraform State Saving
    bucket = "tfstatus"
    key    = "terraform-state.tfstate"
    region = "us-east-1"
  }
}