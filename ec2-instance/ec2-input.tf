variable "instance_type" {
  default = "t2.large"
}

variable "project_name" {
  default = "torch"
}


variable "key_name" {
  default = "Practice"
}

variable "awsgss_sg" {}


variable "subnet_id" {}


variable "ec2-ssm-profile" {}


variable "ami" {
  default = "ami-02daaf23b3890d162"
}
