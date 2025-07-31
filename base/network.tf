#VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-vpc"
  }
}

#Subnet A
resource "aws_subnet" "subnet-public-a" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-subnet-public-a"
  }
}

#Subnet B
resource "aws_subnet" "subnet-public-b" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-subnet-public-b"
  }
}

#Subnet C
resource "aws_subnet" "subnet-public-c" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = "10.10.5.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-subnet-public-c"
  }
}

# IGTW
resource "aws_internet_gateway" "int_gateway" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-igw"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gateway.id
  }
  tags = {
    Name = "${local.StudentName}-${local.StudentSurname}-01-rt"
  }

}
