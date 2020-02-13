
variable "enable_dns_support" {
    default = true
    }

variable "enable_dns_hostnames" {
    default = false
    }

variable "region" {
    default = "us-east-1"
}



variable "vpc_cidr" {
    default = "10.4.0.0/16"
}

variable "publicsubnet_cidrblocks" {
    type = list 
    default = ["10.4.1.0/24","10.4.2.0/24"] 
}

variable "cidr_block" {
  default = "0.0.0.0/0"
}


variable "ec2-instance" {}

