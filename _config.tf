terraform {
  required_version = "1.8.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
  backend "local" {
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  profile = "dev"
}
