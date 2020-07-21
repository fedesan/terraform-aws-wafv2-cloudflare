# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = "security-nonprod"
}