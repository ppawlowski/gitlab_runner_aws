resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name     = "${upper(var.vpc_environment)} - public subnets route table"
    env = var.vpc_environment
  }
}

resource "aws_route_table" "private_subnet_rt" {
  count = length(var.vpc_private_subnets) > 0 ? 1 : 0
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = var.vpc_private_subnets_gateway_instance_id
  }

  tags = {
    Name      = "${upper(var.vpc_environment)} - private subnets route table"
    env       = var.vpc_environment
  }
}

resource "aws_route_table_association" "private_subnets_rt_association" {
  count = length(var.vpc_private_subnets)
  route_table_id = aws_route_table.private_subnet_rt[0].id
  subnet_id = element(aws_subnet.private_subnets.*.id, count.index )
}

resource "aws_route_table_association" "public_subnet_rt_association" {
  count = length(var.vpc_public_subnets)
  route_table_id = aws_route_table.public_subnet_rt.id
  subnet_id = element(aws_subnet.public_subnets.*.id, count.index )
}