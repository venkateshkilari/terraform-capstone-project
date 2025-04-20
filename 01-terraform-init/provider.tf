terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.95.0"
    }
  }

  backend "s3" {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "01-terraform-init/01-terraform-init.tfstate"
    region         = "us-east-1"
    use_lockfile   = true    
  }
}

provider "aws" {
  region = "us-east-1"
}