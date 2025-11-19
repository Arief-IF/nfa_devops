provider "aws" {
    region     = "us-east-1"
    access_key = "AKIAXXUEHUPHQ6WKHAP5Q"
    secret_key = "XXnZuuLaYJS34kFtEd60A0z6bGcfXKNM4zQNkS4"
}

terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 6.14.1"
        }
    }
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
    availability_zone = "us-east-1a"
}

resource "aws_instance" "example" {
    ami                         = "ami-0360c520857e3138f" # Ubuntu 24.04 LTS x86_64
    instance_type               = "t2.micro"
    subnet_id                   = aws_default_subnet.default.id
    associate_public_ip_address = true

    tags = {
        Name = "Ubuntu-Terraform"
    }
}
