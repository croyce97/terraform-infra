resource "aws_s3_bucket" "this" {
  bucket = "${var.project}-${var.environment}-${var.name}"

  tags = {
    Name        = var.name
    Environment = var.environment
    Project     = var.project
  }
}

