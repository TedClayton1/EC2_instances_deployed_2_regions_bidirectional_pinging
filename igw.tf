#########################################
# Internet Gateway – us-east-1
#########################################
resource "aws_internet_gateway" "us_east_igw" {
  provider = aws

  vpc_id = aws_vpc.us_vpc_east.id

  tags = {
    Name = "us-east-1-igw"
  }
}

#########################################
# Internet Gateway – ap-southeast-2
#########################################
resource "aws_internet_gateway" "aps2_igw" {
  provider = aws.aps2

  vpc_id = aws_vpc.aps2_vpc.id

  tags = {
    Name = "ap-southeast-2-igw"
  }
}
