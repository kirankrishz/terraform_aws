resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "terraform_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.0.0/17"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform_public_subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "terraform_public_rt"
  }
}