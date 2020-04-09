module "gitlab_runner_sg" {
  source = "../security_group"

  security_group_name = "${lower(var.gitlab_runner_environment)}_gitlab_runner_sg"
  security_group_description = "${upper(var.gitlab_runner_environment)} GitLab Runner instance security group"
  security_group_environment = var.gitlab_runner_environment
  security_group_vpc_id = var.gitlab_runner_deploy_vpc_id
  security_group_ingress_rules = [
    {
      description = "Allow 22/tcp from VPC"
      from_port   = 22
      to_port     = 22
      source_cidr = data.aws_vpc.vpc.cidr_block
    }
  ]
  security_group_egress_rules = [
    {
      description = "Allow all outgoing connections"
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      source_cidr = "0.0.0.0/0"
    }
  ]
}