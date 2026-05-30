terraform {
  backend "s3" {
    bucket         = "terraform-state-hanisha"
    key            = "staging/state.tf"
    region         = "ap-south-2"
    dynamodb_table = "terraform-locks"
  }
}