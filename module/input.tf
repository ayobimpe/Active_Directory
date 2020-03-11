variable "region" {
  default = "us-gov-west-1"
}


variable "domain_name" {}

variable "admin_password" {}


variable "ssl-cert" {
  description = "Enter the ssl certificate for the App Load Balancer"
}