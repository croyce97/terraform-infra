terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "iam_username" {
  description = "Tên IAM user cho môi trường dev"
  type        = string
  default     = "prod-user"
}