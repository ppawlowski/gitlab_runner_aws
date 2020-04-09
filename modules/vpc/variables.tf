variable "vpc_environment" {
  type = string
}

variable "vpc_cidr" {
  type        = string
}

variable "vpc_enable_dns_hostnames" {
  type = bool
  default = true
}

variable "vpc_enable_dns_support" {
  type = bool
  default = true
}

variable "vpc_public_subnets_ingress_rules" {
  type = list(map(string))
  default = []
}

variable "vpc_public_subnets_egress_rules" {
  type = list(map(string))
  default = []
}

variable "vpc_private_subnets_ingress_rules" {
  type = list(map(string))
  default = []
}

variable "vpc_private_subnets_egress_rules" {
  type = list(map(string))
  default = []
}

variable "vpc_public_subnets" {
  type = list(string)
  default = []
}

variable "vpc_private_subnets" {
  type = list(string)
  default = []
}

variable "vpc_private_subnets_gateway_instance_id" {
  type = string
  default = ""
}