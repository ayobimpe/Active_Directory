variable "ssm_policy_arn" {
    type = list
    default = ["arn:aws-us-gov:iam::aws:policy/AmazonSSMManagedInstanceCore", "arn:aws-us-gov:iam::aws:policy/AmazonSSMDirectoryServiceAccess"]
}


variable "awsgss_kms" {}

variable "window_instance" {}
