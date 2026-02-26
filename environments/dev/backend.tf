terraform {
  backend "s3" {
    # Cập nhật các giá trị này theo output của script script/remote-state.sh (ENV=dev)
    bucket         = "tfstate-my-terraform-dev-558227455530"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "tf-lock-my-terraform-dev"
    encrypt        = true
  }
}

