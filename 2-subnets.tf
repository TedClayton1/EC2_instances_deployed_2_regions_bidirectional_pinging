#########################################
# US-EAST-1 PUBLIC SUBNET
#########################################
resource "aws_subnet" "us_east_public" {
  provider = aws

  vpc_id                  = aws_vpc.us_vpc_east.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "us-east-1-public-subnet"
  }
}

#########################################
# AP-SOUTHEAST-2 PUBLIC SUBNET
#########################################
resource "aws_subnet" "aps2_public" {
  provider = aws.aps2

  vpc_id                  = aws_vpc.aps2_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "ap-southeast-2-public-subnet"
  }
}
