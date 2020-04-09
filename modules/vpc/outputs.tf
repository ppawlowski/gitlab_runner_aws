output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "vpc_public_subnets_ids" {
  value = aws_subnet.public_subnets.*.id
}

output "vpc_private_subnets_ids" {
  value = aws_subnet.private_subnets.*.id
}