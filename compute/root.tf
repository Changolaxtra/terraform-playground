terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  default_tags {
    tags = {
      Terraform = "true"
      Project   = "epam-tf-lab"
      Owner     = "${local.StudentName}_${local.StudentSurname}"
    }
  }
}