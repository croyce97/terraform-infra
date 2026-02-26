output "instance_id" {
  description = "ID của EC2 instance"
  value       = aws_instance.this.id
}

output "public_ip" {
  description = "Public IP của EC2 instance"
  value       = aws_instance.this.public_ip
}

