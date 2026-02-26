terraform {
  backend "s3" {
    # Cập nhật các giá trị này theo output của script script/remote-state.sh (ENV=prod)
    bucket         = "tfstate-my-terraform-prod-123456789012"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "tf-lock-my-terraform-prod"
    encrypt        = true
  }
}

