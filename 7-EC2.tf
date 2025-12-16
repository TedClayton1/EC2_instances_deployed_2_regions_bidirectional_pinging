##############################
# US-EAST-1 EC2
##############################

# Dynamically find the latest Amazon Linux 2 AMI in us-east-1
data "aws_ami" "us_east_al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "us_east_server" {
  ami           = data.aws_ami.us_east_al2.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.us_east_public.id
  vpc_security_group_ids = [aws_security_group.us_sg.id]
  key_name = "terraform-key"

  
  tags = {
    Name = "US-East-1-Server"
  }
}

##############################
# AP-SOUTHEAST-2 EC2
##############################

# Dynamically find the latest Amazon Linux 2 AMI in ap-southeast-2
data "aws_ami" "aps2_al2" {
  provider    = aws.aps2
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "aps2_server" {
  provider      = aws.aps2
  ami           = data.aws_ami.aps2_al2.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.aps2_public.id
  vpc_security_group_ids = [aws_security_group.aps2_sg.id]
  key_name = "terraform-key-aps2"

  

  tags = {
    Name = "AP-Southeast-2-Server"
  }
}
