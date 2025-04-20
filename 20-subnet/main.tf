resource "aws_subnet" "subnet_1" {
  vpc_id            = data.terraform_remote_state._10-vpc.outputs.vpc_id
  cidr_block        = var.subnet_1_cidr
  map_public_ip_on_launch = false
  availability_zone = "us-east-1c"
  tags = {
    Environment = var.environment
  }
  
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = data.terraform_remote_state._10-vpc.outputs.vpc_id
  cidr_block        = var.subnet_2_cidr
  map_public_ip_on_launch = false
  availability_zone = "us-east-1b"
  tags = {
    Environment = var.environment
  }
  
}