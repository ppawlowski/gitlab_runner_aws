variable "nacl_name" {
  type = string
}

variable "nacl_environment" {
  type = string
}

variable "nacl_vpc_id" {
  type = string
}

variable "nacl_subnets_ids" {
  type = list(string)
}

variable "nacl_ingress_rules" {
  type = list(map(string))
  default = []
}

variable "nacl_egress_rules" {
  type = list(map(string))
  default = []
}