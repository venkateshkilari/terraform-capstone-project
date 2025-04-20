resource "aws_internet_gateway" "igw" {
  vpc_id = data.terraform_remote_state._10-vpc.outputs.vpc_id
}

resource "aws_route_table" "public_rt" {
  vpc_id = data.terraform_remote_state._10-vpc.outputs.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_subnet1_assoc" {
  subnet_id      = data.terraform_remote_state._20-subnet.outputs.subnet_1
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet2_assoc" {
  subnet_id      = data.terraform_remote_state._20-subnet.outputs.subnet_2
  route_table_id = aws_route_table.public_rt.id
}

# Application Load Balancer
resource "aws_lb" "app_lb" {
  name               = "my-app-alb"
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state._30-security-group.outputs.alb_sg]
  subnets            = [data.terraform_remote_state._20-subnet.outputs.subnet_1, data.terraform_remote_state._20-subnet.outputs.subnet_2]
}

# Target group
resource "aws_lb_target_group" "app_tg_blue" {
  name     = "my-app-tg-blue"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state._10-vpc.outputs.vpc_id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }
 
   lifecycle {
     create_before_destroy = true
   }
}

resource "aws_lb_target_group" "app_tg_green" {
  name     = "my-app-tg-green"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state._10-vpc.outputs.vpc_id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold  = 2
    unhealthy_threshold = 2
  }
  lifecycle {
     create_before_destroy = true
   }
}

# Listener
resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    #target_group_arn = aws_lb_target_group.app_tg_blue.arn
    target_group_arn = aws_lb_target_group.app_tg_green.arn
  }

}

resource "aws_lb_target_group_attachment" "ec2_blue_attach" {
  target_group_arn = aws_lb_target_group.app_tg_blue.arn
  target_id        = data.terraform_remote_state._60-virtual-machine.outputs.blue_instance_id
  port             = 80

  }

  
resource "aws_lb_target_group_attachment" "ec2_green_attach" {
  target_group_arn = aws_lb_target_group.app_tg_green.arn
  target_id        = data.terraform_remote_state._60-virtual-machine.outputs.green_instance_id
  port             = 80

  }
