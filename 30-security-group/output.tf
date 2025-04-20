output "instance_sg" {
  value = aws_security_group.instance_sg.id
  
}

output "alb_sg" {
  value = aws_security_group.alb_sg.id
  
}