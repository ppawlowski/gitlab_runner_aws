resource "aws_network_acl" "nacl" {
  vpc_id = var.nacl_vpc_id
  subnet_ids = var.nacl_subnets_ids
  tags = {
    Name      = "${upper(var.nacl_environment)} - ${var.nacl_name}"
    env       = var.nacl_environment
  }
}

resource "aws_network_acl_rule" "ingress" {
  count = length(var.nacl_ingress_rules)
  network_acl_id = aws_network_acl.nacl.id
  egress = false
  rule_number = count.index + 1
  rule_action = lookup(var.nacl_ingress_rules[count.index], "rule_action", "allow")
  protocol = lookup(var.nacl_ingress_rules[count.index], "protocol")
  cidr_block = lookup(var.nacl_ingress_rules[count.index], "source_cidr")
  from_port = lookup(var.nacl_ingress_rules[count.index], "from_port")
  to_port = lookup(var.nacl_ingress_rules[count.index], "to_port")
}

resource "aws_network_acl_rule" "egress" {
  count = length(var.nacl_egress_rules)
  network_acl_id = aws_network_acl.nacl.id
  egress = true
  rule_number = count.index + 1
  rule_action = lookup(var.nacl_egress_rules[count.index], "rule_action", "allow")
  protocol = lookup(var.nacl_egress_rules[count.index], "protocol")
  cidr_block = lookup(var.nacl_egress_rules[count.index], "source_cidr")
  from_port = lookup(var.nacl_egress_rules[count.index], "from_port")
  to_port = lookup(var.nacl_egress_rules[count.index], "to_port")
}