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
  ami           = "ami-096f43ef67d75e998"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id


  tags = {
    Name = "gavin-example-ec2"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "tf-example-subnet"
  }
}