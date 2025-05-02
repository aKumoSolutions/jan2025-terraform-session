terraform {
  required_version = "~> 1.11.0"   // Terraform Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.96.0"
    }
  }
}

// ~> = Lazy Constraints

// Semantic Versioning = 1.11.4
// 1 = Major (Upgrade) = Breaking Changes
// 11 = Minor (Update) = Feature gets added
// 4 = Patch  (Patch)  = Fix bugs, vulnerabilities


//  ">= 1.2.0, < 2.0.0" 