## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
#  Variables for final project

variable "availability_zone" {}

variable "ami" {}

variable "instance_type" {
  default = "t2.micro" # Free Tier eligible
}

variable "project_tags" {
  default = "fp_instances"
}

variable "key_name" {}

variable "subnet_id" {}

variable "vpc_security_group_id1" {}

variable "vpc_security_group_id2" {}

variable "vpc_security_group_id3" {}




