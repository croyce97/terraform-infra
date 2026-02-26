output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}

output "ec2_public_ip" {
  description = "EC2 public IP"
  value       = module.ec2.public_ip
}

output "demo_bucket_name" {
  description = "Tên S3 bucket demo"
  value       = module.s3.bucket_name
}

