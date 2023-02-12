## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zone" {}

variable "vpc_id" {}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "project_tags" {
  default = "fp_network"
}


