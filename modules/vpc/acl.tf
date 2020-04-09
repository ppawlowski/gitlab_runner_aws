module "public_subnets_acl" {
  source = "../network_acl"
  nacl_environment = var.vpc_environment
  nacl_vpc_id = aws_vpc.main_vpc.id

  nacl_name = "public subnets ACL"
  nacl_subnets_ids = aws_subnet.public_subnets.*.id
  nacl_ingress_rules = var.vpc_public_subnets_ingress_rules
  nacl_egress_rules = var.vpc_public_subnets_egress_rules
}

module "private_subnets_acl" {
  source = "../network_acl"
  nacl_environment = var.vpc_environment
  nacl_vpc_id = aws_vpc.main_vpc.id

  nacl_name = "private subnets ACL"
  nacl_subnets_ids = aws_subnet.private_subnets.*.id
  nacl_ingress_rules = var.vpc_private_subnets_ingress_rules
  nacl_egress_rules = var.vpc_private_subnets_egress_rules
}