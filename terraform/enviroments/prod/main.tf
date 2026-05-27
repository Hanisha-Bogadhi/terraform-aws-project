module "ec2" {
  source        = "../../modules/ec2"
  instance_name = "prod-flask"
  instance_type = "t3.micro"   # Free tier safe
}