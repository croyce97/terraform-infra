output "arn" {
  description = "ARN của IAM user"
  value       = aws_iam_user.this.arn
}

output "name" {
  description = "Tên IAM user"
  value       = aws_iam_user.this.name
}
