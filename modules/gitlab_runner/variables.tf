variable "gitlab_runner_environment" {
  type = string
}
variable "gitlab_runner_deploy_vpc_id" {
  type = string
}
variable "gitlab_runner_deploy_subnets_ids_list" {
  type = list(string)
}
variable "gitlab_runner_instance_count" {
  type = number
}
variable "gitlab_runner_instance_type" {
  type = string
  default = "t2.micro"
}
variable "gitlab_runner_ssh_pub_key" {
  type = string
}
variable "gitlab_runner_version" {
  type = string
}
variable "gitlab_runner_gitlab_instance_url" {
  type = string
  default = "https://gitlab.com/"
}
variable "gitlab_runner_registration_token" {
  type = string
}
variable "gitlab_runner_tags" {
  type = string
}