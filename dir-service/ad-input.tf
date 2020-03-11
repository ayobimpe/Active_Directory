variable "region" {
  description = "AWS region where the Active Directory will be deployed"
  default = "us-gov-west-1"
}

variable "domain_name" {}

variable "admin_password" {}


variable "dir_type" {
  default     = "MicrosoftAD"
}

variable "dir_computer_ou" {
  default     = "OU=awsgss,DC=awsgss,DC=com"
}

variable "vpc_id" {}

variable "public-subnet" {
  type = list 
}