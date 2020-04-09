terraform {
  required_version = ">=0.12.0, < 0.13"
  required_providers {
    aws = "=2.56.0"
  }
}
provider "aws" {
  region = "eu-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}