## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# Security group for final project

resource "aws_security_group" "ssh_access" {
  name                 = "ssh_access"
  description          = "Allow SSH connection"
  vpc_id               = var.vpc_id

   ingress {
     description       = "SSH"
     from_port         = 22
     to_port           = 22
     protocol          = "tcp"
     cidr_blocks       = [ "0.0.0.0/0"]
     ipv6_cidr_blocks  = ["::/0"]
  }
   egress {
      description      = "SSH"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [ "0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
tags                   = merge(var.project_tags, { Name = "Allow ssh connection" }, )
}

resource "aws_security_group" "web_servers" {
  name                 = "web_servers"
  description          = "Allow HTTP/S inbound traffic"
  vpc_id               = var.vpc_id

  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      description      = "allow_http/s_to_web_servers"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  egress {
    from_port          = 0
    to_port            = 0
    protocol           = "-1"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }
tags                   = merge(var.project_tags, { Name = "allow http/s to web servers" }, )
}

resource "aws_security_group" "jenkins_access" {
  name                 = "jenkins_access"
  description          = "Allow jenkins access"
  vpc_id               = var.vpc_id

  dynamic "ingress" {
    for_each = ["8080", "50000"]
    content {
      description      = "jenkins port"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  } 
 egress {
      description      = "jenkins_access"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [ "0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
tags                   = merge(var.project_tags, { Name = "Allow jenkins access" }, )
}


