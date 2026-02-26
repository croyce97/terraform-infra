variable "name" {
  description = "Tên logic cho EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID để tạo instance"
  type        = string
}

variable "environment" {
  description = "Tên môi trường (vd: dev, prod)"
  type        = string
}

variable "project" {
  description = "Tên project"
  type        = string
}

