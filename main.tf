terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region = "eu-west-1"
}

resource "aws_instance" "my-new-ec2" {
  ami           = "ami-0526a2ea416570f68"
  instance_type = "t2.micro"

  tags = {
    Name = "gavin-example-ec2"
  }
}