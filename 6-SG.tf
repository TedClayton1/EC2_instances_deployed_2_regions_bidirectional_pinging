############################
# US-East-1 Security Group
############################
resource "aws_security_group" "us_sg" {
  vpc_id = aws_vpc.us_vpc_east.id

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["10.1.0.0/16"] # allow ping from AP-Southeast-2 VPC
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"] # replace with your IP
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

############################
# AP-Southeast-2 Security Group
############################
resource "aws_security_group" "aps2_sg" {
  provider = aws.aps2
  vpc_id   = aws_vpc.aps2_vpc.id

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = ["10.0.0.0/16"] # allow ping from US-East-1 VPC
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"] # replace with your IP
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}






