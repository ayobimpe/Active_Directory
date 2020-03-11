output "awsgss_sg" {
  value = aws_security_group.awsgss_sg.id
}

output "awsgss_lb_sg" {
  value = aws_security_group.awsgss_lb_sg.id
}