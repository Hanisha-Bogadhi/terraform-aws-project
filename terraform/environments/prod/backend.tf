terraform {
  backend "s3" {
    bucket         = "terraform-state-hanisha"
    key            = "prod/state.tf"
    region         = "ap-south-2"
    dynamodb_table = "terraform-locks"
  }
}