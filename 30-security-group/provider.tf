terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "=5.95.0"
        }
    }
    
    backend "s3" {
        bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
        key            = "30-security-group/30-security-group.tfstate"
        region         = "us-east-1"
        use_lockfile   = true    
    }
}

provider "aws" {
    region = "us-east-1"
  
}