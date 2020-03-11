#Create EC2 Instance
resource "aws_instance" "domainjoin" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = false
  subnet_id                   = var.subnet_id[0]
  key_name                    = var.key_name
  iam_instance_profile        = var.ec2-ssm-profile
  vpc_security_group_ids      = [var.awsgss_sg]
  tags = {
    Name = var.project_name
    }
}





