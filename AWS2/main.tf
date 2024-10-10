terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA356SJUTICMYYOENK"
  secret_key = "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"
}

resource "aws_instance" "web_test3" {
  ami           = "ami-08eb150f611ca277f"  
  instance_type = "t3.micro"
  key_name      = "test4"

 
  vpc_security_group_ids = ["sg-054bd76a3d1fa466b"]  

  tags = {
    Name = "web_test3"
  }
}
