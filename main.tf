terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"

   default_tags {
     tags = {
       Environment = "Test"
       Name        = "Provider Tag"
     }
   }
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Owner = "example"
    VPC_Name = "Atanas Test"
    Soucre   = "Resource Tag"
  }
}

output "vpc_resource_level_tags" {
  value = aws_vpc.example.tags
}

// output "vpc_all_tags" {
//   value = aws_vpc.example.tags_all
// }
