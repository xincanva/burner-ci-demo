variable "aws_region" {
  description = "AWS region"
  default = "us-west-1"
  type = string
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
  type = string
}

variable "name" {
  type = string
  description = "name to pass to Name tag"
  default = "Provisioned by Terraform"
}

variable "environment_name" {
  description = "Environment name for current deployment"
  type        = string
}
