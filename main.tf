provider "aws" {
  region = var.aws_region
}

resource "aws_cloud9_environment_ec2" "example" {
  instance_type = var.instance_type 
  name          = var.cloud9_name
  image_id      = "amazonlinux-2023-x86_64"
}

data "aws_instance" "cloud9_instance" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [
    aws_cloud9_environment_ec2.example.id]
  }
}

resource "aws_eip" "cloud9_eip" {
  instance = data.aws_instance.cloud9_instance.id
  domain   = "vpc"
}

