terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.43"
    }
  }

  required_version = "~> 1.0"
}

provider "aws" {
  region = var.aws_region
}

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ssm_parameter.ami.value
  instance_type = var.instance_type
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.environment_name}-${var.name}"
  }
}
