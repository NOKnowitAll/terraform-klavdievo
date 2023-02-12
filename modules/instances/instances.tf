## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Instance for final project

# ============================ dev-environment ================================

resource "aws_instance" "ansible" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  user_data                   = file("./modules/instances/scriptAnsible.sh")
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.vpc_security_group_id1]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags                        = merge( var.project_tags, { Name = "Ansible" }, )
  depends_on                  = [aws_instance.jenkins, aws_instance.prodserver]
}

resource "aws_instance" "jenkins" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  user_data                   = file("./modules/instances/scriptVM.sh")
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.vpc_security_group_id1, var.vpc_security_group_id2]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags                        = merge(var.project_tags, { Name = "Jenkins" }, )
}

resource "aws_instance" "prodserver" {
  ami                         = var.ami
  availability_zone           = var.availability_zone
  instance_type               = var.instance_type
  user_data                   = file("./modules/instances/scriptVM.sh")
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.vpc_security_group_id1, var.vpc_security_group_id3]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  tags                        = merge(var.project_tags, { Name = "Prod_Server" }, )
}

# ============================ prod-environment ===============================


