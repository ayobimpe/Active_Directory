provider "aws" {
  region = var.region
}

module "network" {
  source             = "../network"
  ec2-instance       = module.ec2-instance.domainjoin
}

module "dir-service" {
  source   = "../dir-service"
  vpc_id   = module.network.aws_gss
  public-subnet = module.network.public-subnet
  window_instance = module.ec2-instance.domainjoin
  domain_name    = var.domain_name
	admin_password = var.admin_password
  awsgss_kms     = module.kms.awsgsskey
}

module "ec2-instance" {
  source             = "../ec2-instance"
  awsgss_sg          = module.sec-grp.awsgss_sg
  subnet_id          = module.network.public-subnet
  ec2-ssm-profile    = module.dir-service.ec2-ssm-role-profile
}


module "sec-grp" {
  source      = "../sec-grp"
  vpc_id     = module.network.aws_gss
}

# module "ssm" {
#   source       = "../ssm"
#   awsgss_kms   = module.kms.awsgsskey
#   ad           = module.dir-service.ad
#   dnsIpAddresses = jsonencode(module.dir-service.aws_gss_vpc_dns_ip_addresses)
#   domain_name = var.domain_name
#   admin_password = var.admin_password
#   window_instance = module.ec2-instance.domainjoin
# }

module "kms" {
  source       = "../kms"
}