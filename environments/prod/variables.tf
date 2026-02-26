variable "project" {
  description = "Tên project (vd: my-terraform)"
  type        = string
  default     = "my-terraform"
}

variable "environment" {
  description = "Tên môi trường"
  type        = string
  default     = "prod"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "ec2_ami_id" {
  description = "AMI ID dùng cho EC2 instance"
  type        = string
  default     = "ami-0ac0e4288aa341886"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

