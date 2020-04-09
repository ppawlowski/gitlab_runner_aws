variable "nat_instance_environment" {
  type = string
}

variable "nat_instance_deploy_vpc_id" {
  type = string
}

variable "nat_instance_nated_subnets_cidr_list" {
  type = list(string)
}

variable "nat_instance_type" {
  type = string
  default = "t2.micro"
}

variable "nat_instance_deploy_subnets_ids_list" {
  type = list(string)
}

variable "nat_instance_ssh_pub_key" {
  type = string
}