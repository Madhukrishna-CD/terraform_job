resource "aws_vpc" "vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"
  

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.internet_gateway_name}"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.public_subnet1_cidr}"
  availability_zone = "${var.availability_zone_ps1}"
 
  tags = {
    Name = "${var.public_subnet1_name}"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.public_subnet2_cidr}"
  availability_zone = "${var.availability_zone_ps2}"
 
  tags = {
    Name = "${var.public_subnet2_name}"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private_subnet1_cidr}"
  availability_zone ="${var.availability_zone_prts1}"
 
  tags = {
    Name = "${var.private_subnet1_name}"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "${var.private_subnet2_cidr}"
  availability_zone = "${var.availability_zone_prts2}"

  tags = {
    Name = "${var.private_subnet2_name}"
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.route_table_name}"
  }
}
resource "aws_eip" "eip" {
  vpc = true
  depends_on  = [aws_internet_gateway.igw]
}

# Create a Endpoint for VPC
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.ap-south-1.s3"

  tags = {
    Name = "${var.Endpoint_name}"
  }
}