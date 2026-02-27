resource "aws_iam_user" "this" {
  name = var.name
  path = "/"

  tags = {
    Name        = var.name
    Environment = var.environment
    Project     = var.project
  }
}
