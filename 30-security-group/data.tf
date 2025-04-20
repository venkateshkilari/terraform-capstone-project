data "terraform_remote_state" "_10-vpc" {
  backend = "s3"
  config = {
    bucket         = "capstone-tf-state-da3df6ed-da52-3e3c-280e-6ea3f9e73541"
    key            = "10-vpc/10-vpc.tfstate"
    region         = "us-east-1"
  }
  
}