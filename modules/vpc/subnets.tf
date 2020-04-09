resource "aws_subnet" "public_subnets" {
  count = length(var.vpc_public_subnets)
  cidr_block = element(var.vpc_public_subnets, count.index )
  availability_zone = element(data.aws_availability_zones.availability_zones.names, count.index )
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name      = "${upper(var.vpc_environment)} - public subnet ${count.index + 1}"
    env       = var.vpc_environment
    Tier      = "public"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.vpc_private_subnets)
  cidr_block = element(var.vpc_private_subnets, count.index )
  availability_zone = element(data.aws_availability_zones.availability_zones.names, count.index )
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name      = "${upper(var.vpc_environment)} - private subnet ${count.index + 1}"
    env       = var.vpc_environment
    Tier      = "private"
  }
}