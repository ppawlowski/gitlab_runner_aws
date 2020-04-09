resource "aws_security_group" "security_group" {
  name = var.security_group_name
  description = var.security_group_description
  vpc_id = var.security_group_vpc_id

  tags = {
    Name = "${upper(var.security_group_environment)} ${var.security_group_name}"
    env  = var.security_group_environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ingress" {
  count = length(var.security_group_ingress_rules)
  type = "ingress"
  description = lookup(var.security_group_ingress_rules[count.index], "description", "Ingress rule no.${count.index+1}"  )
  from_port = lookup(var.security_group_ingress_rules[count.index], "from_port" )
  to_port = lookup(var.security_group_ingress_rules[count.index], "to_port" )
  protocol = lookup(var.security_group_ingress_rules[count.index], "protocol", "tcp" )
  cidr_blocks = split(",", lookup(var.security_group_ingress_rules[count.index], "source_cidr" ) )

  security_group_id = aws_security_group.security_group.id
}

resource "aws_security_group_rule" "egress" {
  count = length(var.security_group_egress_rules)
  type = "egress"
  description = lookup(var.security_group_egress_rules[count.index], "description", "Egress rule no.${count.index+1}" )
  from_port = lookup(var.security_group_egress_rules[count.index], "from_port")
  to_port = lookup(var.security_group_egress_rules[count.index], "to_port")
  protocol = lookup(var.security_group_egress_rules[count.index], "protocol", "tcp")
  cidr_blocks = split(",", lookup(var.security_group_egress_rules[count.index], "source_cidr" ) )

  security_group_id = aws_security_group.security_group.id
}