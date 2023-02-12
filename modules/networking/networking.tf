## EPAM Cloud&DevOps Fundamentals Autumn 2022
# Final Project: Klavdievo
# networking for final project

# declare a VPC
resource "aws_vpc" "main" {
  cidr_block              = "${var.vpc_cidr}"
  enable_dns_hostnames    = true
  enable_dns_support      = true
  tags                    = merge(var.project_tags, { Name = "Main vpc" }, )
}

resource "aws_subnet" "subnet" {
  availability_zone       = var.availability_zone
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.subnet_cidr}"
  map_public_ip_on_launch = true
  tags                    = merge(var.project_tags, { Name = "Private Subnet" }, )
}


resource "aws_internet_gateway" "vpc_igw" {
  vpc_id                  = "${var.vpc_id}"
  tags                    = merge(var.project_tags, { Name = "VPC - Internet Gateway" }, )
}

resource "aws_route_table" "vpc_subnet" {
  vpc_id                = "${var.vpc_id}"

  route {
      cidr_block        = "0.0.0.0/0"
      gateway_id        = aws_internet_gateway.vpc_igw.id
  }
  tags                  = merge(var.project_tags, { Name = "VPC - Internet Gateway" }, )
}

resource "aws_route_table_association" "vpc_subnet" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.vpc_subnet.id
}














