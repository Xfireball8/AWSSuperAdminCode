terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "sfaisalBucket"
    key = "projectSaaS/key"
    region = "eu-west-3"
  }
}

provider "aws" {
  region = var.region
  access_key = var.accessKey
  secret_key = var.secretKey
}


