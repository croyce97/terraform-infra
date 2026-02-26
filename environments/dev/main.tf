locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
  }
}

module "ec2" {
  source = "../../modules/ec2"

  name          = "${var.project}-${var.environment}-ec2"
  ami_id        = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  environment   = var.environment
  project       = var.project
}

module "s3" {
  source = "../../modules/s3"

  name        = "demo-bucket"
  environment = var.environment
  project     = var.project
}

