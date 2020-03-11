resource "tls_private_key" "adfs" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

