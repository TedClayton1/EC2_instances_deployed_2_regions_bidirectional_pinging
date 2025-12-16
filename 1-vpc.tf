#########################################
# VPC – us-east-1
#########################################
resource "aws_vpc" "us_vpc_east" {
  provider = aws

  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "us-east-1-vpc"
  }
}

#########################################
# VPC – ap-southeast-2
#########################################
resource "aws_vpc" "aps2_vpc" {
  provider = aws.aps2

  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "ap-southeast-2-vpc"
  }
}
