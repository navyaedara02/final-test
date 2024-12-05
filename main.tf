provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "app_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.app_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_security_group" "ecs_sg" {
  vpc_id = aws_vpc.app_vpc.id
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
