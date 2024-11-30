terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
count= "4"

  tags = {
    Name = "MyFirstTerraformInstance"
  }
}
