variable "instance_type" {
  default = "t2.large"
}

variable "project_name" {
  default = "torch-aws-gss-domain"
}


variable "key_name" {
  default = "ssokeypair"
}

variable "awsgss_sg" {}


variable "subnet_id" {}


variable "ec2-ssm-profile" {}


variable "ami" {
  default = "ami-94ae88f5"
}