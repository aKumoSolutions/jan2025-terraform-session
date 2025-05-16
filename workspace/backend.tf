terraform {
  backend "s3" {
    bucket  = "terraform-session-backend-bucket-kris"
    key     = "terraform.tfstate"
    region  = "us-west-2"
    encrypt = true
    workspace_key_prefix = "workspaces"
  }
}

# Each workspace will have its own terraform.tfstate file

# Syntax: workspace_key_prefix/workspace_name/key
# Example: workspaces/dev/terraform.tfstate