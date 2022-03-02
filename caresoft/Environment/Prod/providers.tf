terraform {
  required_version = "1.1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.1.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-hub-testing" # add bucket name after creating them in console
    key    = "Prod/statefiles.tf"
    region = "ap-south-1"

  }
}

provider "aws" {
  region     = var.aws_region
}
