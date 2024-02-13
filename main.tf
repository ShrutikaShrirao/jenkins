terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }

  # backend "s3" {
  #   bucket  = "aws-cat-tfstate-bucket/TechM-A7-vpc-flowlogs/"
  #   encrypt = true
  #   key     = "terraform.tfstate"
  #   region  = "eu-central-1"
  # }
}

provider "aws" {
  region = var.region
  secret_key = "gyfiewJf4pJ5QG0hurQnDc0f3u66V6i2udu232ym"
  access_key = "AKIAQL63LQCEEL52BA24"
}

# modules

module "vpc" {
  source = "./EC2"
}

