module "ec2" {
  source        = "../../modules/ec2"
  instance_name = "staging-flask"
  instance_type = "t3.micro"
}