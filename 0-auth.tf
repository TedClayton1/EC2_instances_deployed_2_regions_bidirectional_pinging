terraform {
  required_version = ">= 1.5.0"

  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0"
    }
  }
}

#########################################
# DEFAULT PROVIDER (Region #1)
# This will deploy EC2 #1 in us-east-1
#########################################
provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}

#########################################
# ALIASED PROVIDER (Region #2)
# This will deploy EC2 #2 in ap-southeast-2
#########################################
provider "aws" {
  alias  = "aps2"
  region = "ap-southeast-2"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
