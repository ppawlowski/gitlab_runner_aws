resource "aws_instance" "gitlab_runner_instance" {
  count = var.gitlab_runner_instance_count
  ami = data.aws_ami.ubuntu.id
  instance_type = var.gitlab_runner_instance_type
  subnet_id = element(var.gitlab_runner_deploy_subnets_ids_list, count.index)
  vpc_security_group_ids = [module.gitlab_runner_sg.security_group_id]
  key_name = aws_key_pair.gitlab_runner_ssh_key.key_name
  user_data = templatefile("${path.module}/user_data_templates/test.tmpl", {gitlab_runner_version = var.gitlab_runner_version, gitlab_url = var.gitlab_runner_gitlab_instance_url, registration_url = var.gitlab_runner_registration_token, tags = var.gitlab_runner_tags})
  tags = {
    Name = "${lower(var.gitlab_runner_environment)}_gitlab_runner_${format("%02d", count.index + 1)}"
    env = var.gitlab_runner_environment
  }
}

resource "aws_key_pair" "gitlab_runner_ssh_key" {
  key_name = "glr_admin"
  public_key = var.gitlab_runner_ssh_pub_key
}