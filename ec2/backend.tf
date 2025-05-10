terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "ec2/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}