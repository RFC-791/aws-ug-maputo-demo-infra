resource "aws_vpc" "pvt" {
  cidr_block = "10.0.0.0/8"
  tags = {
    Name = "Private VPC"
  }
}

resource "aws_route_table" "default" {
  vpc_id = aws_vpc.pvt.id

  route {
    cidr_block           = aws_vpc.pvt.cidr_block
    network_interface_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pvt-default-rb"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.pvt.id

  tags = {
    Name = "internet-gtw"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.pvt.id
  route_table_id = aws_route_table.default.id
}

resource "aws_subnet" "pvt1a" {
  vpc_id                  = aws_vpc.pvt.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "af-south-1a"

  tags = {
    Name = "SUB-1A-PVT"
  }
}

resource "aws_subnet" "pvt1b" {
  vpc_id                  = aws_vpc.pvt.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "af-south-1b"

  tags = {
    Name = "SUB-1B-PVT"
  }
}

resource "aws_subnet" "pub1a" {
  vpc_id                  = aws_vpc.pvt.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "af-south-1a"

  tags = {
    Name = "SUB-1A-PUB"
  }
}

resource "aws_subnet" "pub1b" {
  vpc_id                  = aws_vpc.pvt.id
  cidr_block              = "10.0.20.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "af-south-1b"

  tags = {
    Name = "SUB-1B-PUB"
  }
}

