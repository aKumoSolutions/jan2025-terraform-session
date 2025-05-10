terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "vpc/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}