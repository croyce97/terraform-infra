output "bucket_name" {
  description = "Tên S3 bucket"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN của S3 bucket"
  value       = aws_s3_bucket.this.arn
}

