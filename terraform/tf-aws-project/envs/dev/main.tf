# ----------------------------
# Network - VPC Module 
# ----------------------------
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  subnet_AZ   = var.subnet_AZ
  environment = var.environment
}

# -------------------------------
# Security - SG Module
# -----------------------------
module "security_group" {
  source = "../../modules/security-group"

  vpc_id_out       = module.vpc.vpc_id_out
  ssh_cidr         = var.ssh_cidr
  http_ipv4_cidr   = var.http_ipv4_cidr
  egress_ipv4_cidr = var.egress_ipv4_cidr
  environment      = var.environment

}


# -------------------------------
# Instances - EC2 Module
# -----------------------------

module "ec2" {
  source         = "../../modules/ec2"
  ec2_type       = var.ec2_type
  sec_grp_id_out = module.security_group.sec_grp_id_out
  subnet_id_out  = module.vpc.subnet_id_out
  environment    = var.environment
}