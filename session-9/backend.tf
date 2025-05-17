terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "session-9/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    dynamodb_table = "terraform-state-locking"
  }
}
