terraform {
  backend "s3" {
    bucket         = "hanisha-terraform-state"
    key            = "dev/state.tf"
    region         = "ap-south-2"
    dynamodb_table = "terraform-locks"
  }
}