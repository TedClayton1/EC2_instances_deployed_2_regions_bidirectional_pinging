#########################################
# Route Table – us-east-1
#########################################
resource "aws_route_table" "us_east_rt" {
  provider = aws

  vpc_id = aws_vpc.us_vpc_east.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east_igw.id
  }

  tags = {
    Name = "us-east-1-public-rt"
  }
}

resource "aws_route_table_association" "us_assoc" {
  provider = aws

  subnet_id      = aws_subnet.us_east_public.id
  route_table_id = aws_route_table.us_east_rt.id
}




#########################################
# Route Table – ap-southeast-2
#########################################
resource "aws_route_table" "aps2_rt" {
  provider = aws.aps2

  vpc_id = aws_vpc.aps2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aps2_igw.id
  }

  tags = {
    Name = "ap-southeast-2-public-rt"
  }
}

resource "aws_route_table_association" "aps2_assoc" {
  provider = aws.aps2

  subnet_id      = aws_subnet.aps2_public.id
  route_table_id = aws_route_table.aps2_rt.id
}




