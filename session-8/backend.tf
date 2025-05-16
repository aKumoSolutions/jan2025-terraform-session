terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "session-8/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}
