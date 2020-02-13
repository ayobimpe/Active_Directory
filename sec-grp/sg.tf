# Define the security group for the windows 
resource "aws_security_group" "awsgss_sg" {
  name = "webserversg"
  description = "Allow incoming SSH access"
  vpc_id= var.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["184.182.197.50/32"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = false
  }


  tags = {
    Name = "awsgss_sg"
  }
}
