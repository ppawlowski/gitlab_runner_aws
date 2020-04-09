variable "security_group_environment" {
  type = string
  description = "Defines environment within which service will be deployed."
}

variable "security_group_name" {
  type = string
  description = "The name of the security group."
}

variable "security_group_description" {
  type = string
  description = "The unique security group description."
}

variable "security_group_vpc_id" {
  type = string
  description = "The ID of the VPC to which security group will be attached."
}

variable "security_group_ingress_rules" {
  type = list(map(string))
  description = "A list of map(s) containing ingress rules to create within security rules."
  default = []
}

variable "security_group_egress_rules" {
  type = list(map(string))
  description = "A list of map(s) containing egress rules to create within security group."
  default = []
}