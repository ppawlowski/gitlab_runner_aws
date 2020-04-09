variable "aws_access_key" {
  type = string
}
variable "aws_secret_key" {
  type = string
}
variable "environment" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "vpc_private_subnets_list" {
  type = list(string)
}
variable "vpc_public_subnets_list" {
  type = list(string)
}
variable "ssh_pub_key" {
  type = string
}
variable "gitlab_runner_registration_token" {
  type = string
}