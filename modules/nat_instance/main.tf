resource "aws_instance" "nat_instance" {
  ami = data.aws_ami.nat_ami.id
  instance_type = var.nat_instance_type
  subnet_id = element(var.nat_instance_deploy_subnets_ids_list, 0)
  vpc_security_group_ids = [module.nat_instance_sg.security_group_id]
  source_dest_check = false
  key_name = aws_key_pair.nat_instance_key.key_name
  tags = {
    Name  = "${lower(var.nat_instance_environment)}_nat_instance"
    env   = var.nat_instance_environment
  }
}

resource "aws_eip" "nat_instance_eip" {
  instance  = aws_instance.nat_instance.id
  vpc       = true
}

resource "aws_key_pair" "nat_instance_key" {
  key_name = "nat_admin"
  public_key = var.nat_instance_ssh_pub_key
}