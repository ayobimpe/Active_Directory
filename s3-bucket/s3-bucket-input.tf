variable "acl" {
  default = "private"
}


variable "versioning_enabled" {
  default = true
  type    = bool
}

variable "region" {
  default = "us-east-1"
}

# variable "kms_key_id" {}

variable "bucket_name" {
  default = "statebackend"
}

variable "kms_deletion_in_days" {
  default = 10
}


variable "awsgss_kms" {}
