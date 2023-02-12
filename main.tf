## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo

provider "aws" {
  region                 = var.region
}

data "aws_availability_zones" "working_zones" {
  state = "available"
}

data "aws_ami" "ubuntu20_latest" {
    owners               = [ "099720109477" ]
    most_recent          = true
    
    filter {
        name             = "name"
        values           = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
}

// Bucket where to SAVE Terraform State
terraform {
  backend "s3" {
    bucket              = "final-project-klavdievo-terraform-state" 
    key                 = "klavdievo/yaroslav_botsman/terraform.tfstate"
    region              = "us-east-2"                               
  }
}

module "fp_access_keys" {
  source                 = "./modules/access_keys"
  key_name               = "klavdievo"
}

module "fp_network" {
  source                 = "./modules/networking"
  availability_zone      = data.aws_availability_zones.working_zones.names[0]
  vpc_cidr               = "192.168.0.0/16"
  subnet_cidr            = "192.168.88.0/24"
  vpc_id                 = "${module.fp_network.vpc_id}"
  project_tags           = var.project_tags
}

module "fp_security-groups" {
  source                 = "./modules/security-groups"
  project_tags           = var.project_tags
  vpc_id                 = "${module.fp_network.vpc_id}"
}

module "fp_instances" {
  source                 = "./modules/instances"
  availability_zone      = data.aws_availability_zones.working_zones.names[0]
  ami                    = data.aws_ami.ubuntu20_latest.id
  instance_type          = var.instance_type
  key_name               = "${module.fp_access_keys.key_name}"
  vpc_security_group_id1 = "${module.fp_security-groups.ssh_access_id}"
  vpc_security_group_id2 = "${module.fp_security-groups.jenkins_access_id}"
  vpc_security_group_id3 = "${module.fp_security-groups.web_servers_id}"
  subnet_id              = "${module.fp_network.subnet_id}"
  project_tags           = var.project_tags
}



