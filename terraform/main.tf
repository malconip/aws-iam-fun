terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  required_version = ">=0.14.9"

}

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "malconip-terraform-state"
    key    = "tfstate-iam"
    region = "us-east-1"
  }
}
