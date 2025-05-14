terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "session-6/dev/terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
  }
}

variable "env" {
  default = "dev"
}
# session-6/dev/terraform.tfstate
# session-6/prod/terraform.tfstate

# terraform apply -var-file=dev.tfvars
# terraform apply -var-file=prod.tfvars
