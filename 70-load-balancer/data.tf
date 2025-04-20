data "terraform_remote_state" "_10-vpc" {
  backend = "s3"
  config = {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "10-vpc/10-vpc.tfstate"
    region         = "us-east-1"
  }
  # Use the output from the VPC module to get the VPC ID
  
}

data "terraform_remote_state" "_20-subnet" {
  backend = "s3"
  config = {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "20-subnet/20-subnet.tfstate"
    region         = "us-east-1"
  }
  
}

data "terraform_remote_state" "_30-security-group" {
  backend = "s3"
  config = {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "30-security-group/30-security-group.tfstate"
    region         = "us-east-1"
  }
  
}

data "terraform_remote_state" "_60-virtual-machine" {
  backend = "s3"
  config = {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "60-virtual-machine/60-virtual-machine.tfstate"
    region         = "us-east-1"
  }
  
}