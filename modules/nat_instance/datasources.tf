data "aws_ami" "nat_ami" {
  owners = ["amazon"]
  most_recent = true
  name_regex = "^amzn-ami-vpc-nat-hvm*"

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}