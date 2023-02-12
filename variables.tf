## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
#  Variables for final project

variable "region" {
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  type        = string
  description = "Instance type for our instance"
  default     = "t2.micro" # Free Tier eligible
}

variable "project_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default     = {
    Owner     = "Yaroslav Botsman"
    Project   = "Klavdievo"
  }
}


