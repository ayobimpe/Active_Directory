variable "load_balancer_type" {
  default = "application"
}

variable "alb_internal" {
  default = true
}
variable "alb_name" {
  default = "torch-awsgss-alb"
}

variable "targetgrp_name" {
  default = "torch-awsgss-targetgrp" 
}

variable "healthy_threshold" {
  default = 5 
}

variable "unhealthy_threshold" {
  default = 2
}

variable "healthcheck_interval" {
  default = 30
}

variable "healthcheck_path" {
  default = "/adfs/ls/IdpInitiatedSignOn.aspx"
}

variable "health_check_timeout" {
  default = 5
}

variable "health_check_matcher" {
  default = "200"
}
variable "httpsport"{
  default = "443"
}

variable "httpprotocol" {
  default = "HTTPS"
}

variable "hcport"{
  default = "22"
}

variable "hcprotocol" {
  default = "TCP"
}

variable "routing_action" {
  default = "forward"
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2016-08"
}

variable "ssl-cert" {
  description = "Enter the ssl certificate for the App Load Balancer"
}


variable "field" {
  default = "path-pattern"
}

variable "field_values" {
  default = "/"
}

variable "domain_instance" {}

variable "subnet_ids" {
  type = list 
}

variable "vpc_id"  {}

variable "awsgss_lb_sg" {}

