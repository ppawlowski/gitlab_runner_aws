module "nat_instance_sg" {
  source = "../security_group"

  security_group_name = "${lower(var.nat_instance_environment)}_nat_sg"
  security_group_description = "${upper(var.nat_instance_environment)} NAT instance security group"
  security_group_environment = var.nat_instance_environment
  security_group_vpc_id = var.nat_instance_deploy_vpc_id
  security_group_ingress_rules = [
    {
      description = "Allow 80/tcp from private subnets"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      source_cidr = join(",", var.nat_instance_nated_subnets_cidr_list)
    },
    {
      description = "Allow 443/tcp from private subnets"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      source_cidr = join(",", var.nat_instance_nated_subnets_cidr_list)
    },
    {
      description = "Allow 22/tcp from the Internet"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      source_cidr = "0.0.0.0/0"
    }
  ]
  security_group_egress_rules = [
    {
      description = "Allow outbound http traffic"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      source_cidr = "0.0.0.0/0"
    },
    {
      description = "Allow outbound https traffic"
      from_port = 443
      to_port = 443
      protocol = "tcp"
      source_cidr = "0.0.0.0/0"
    },
    {
      description = "Allow access to internal network"
      from_port = 0
      to_port = 0
      protocol = "all"
      source_cidr = "10.0.0.0/16"
    }
  ]
}