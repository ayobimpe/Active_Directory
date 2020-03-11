# Define the security group for the windows instance
resource "aws_security_group" "awsgss_sg" {
  name = "ad_sg"
  description = "Allow access to domain"
  vpc_id= var.vpc_id
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["184.182.197.50/32"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_groups = [aws_security_group.awsgss_lb_sg.id]
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



# Define the security group for the load balancer
resource "aws_security_group" "awsgss_lb_sg" {
  name = "awsgss_lb_sg"
  description = "Allow access"
  vpc_id= var.vpc_id
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = false
  }


  tags = {
    Name = "awsgss_lb_sg"
  }
}


