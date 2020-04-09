module "vpc_test" {
  source = "../modules/vpc"
  vpc_environment = var.environment

  vpc_cidr = var.vpc_cidr
  vpc_private_subnets_gateway_instance_id = module.nat_instance.nat_instance_id
  vpc_public_subnets = var.vpc_public_subnets_list
  vpc_private_subnets = var.vpc_private_subnets_list
  vpc_public_subnets_ingress_rules = [
    {
      source_cidr = var.vpc_cidr
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    },
    {
      source_cidr = "0.0.0.0/0"
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    }
  ]
  vpc_public_subnets_egress_rules = [
    {
      source_cidr = var.vpc_cidr
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    },
    {
      source_cidr = "0.0.0.0/0"
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    }
  ]
  vpc_private_subnets_ingress_rules = [
    {
      source_cidr = "0.0.0.0/0"
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    }
  ]
  vpc_private_subnets_egress_rules = [
    {
      source_cidr = "0.0.0.0/0"
      protocol    = "all"
      from_port   = 0
      to_port     = 0
    }
  ]
}

module "nat_instance" {
  source = "../modules/nat_instance"

  nat_instance_environment = var.environment
  nat_instance_ssh_pub_key = var.ssh_pub_key
  nat_instance_nated_subnets_cidr_list = var.vpc_private_subnets_list
  nat_instance_deploy_subnets_ids_list = module.vpc_test.vpc_public_subnets_ids
  nat_instance_deploy_vpc_id = module.vpc_test.vpc_id
}

module "gitlab_runners" {
  source = "../modules/gitlab_runner"

  gitlab_runner_environment = var.environment
  gitlab_runner_ssh_pub_key = var.ssh_pub_key
  gitlab_runner_instance_count = 3
  gitlab_runner_version = "12.0.0"
  gitlab_runner_registration_token = var.gitlab_runner_registration_token
  gitlab_runner_tags = "aws"
  gitlab_runner_deploy_subnets_ids_list = module.vpc_test.vpc_private_subnets_ids
  gitlab_runner_deploy_vpc_id = module.vpc_test.vpc_id
}