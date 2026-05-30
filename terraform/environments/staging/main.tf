module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "ec2" {
  source        = "../../modules/ec2"
  instance_name = "staging-flask"
  instance_type = "t3.micro"
  ami_id        = "ami-024ebedf48d280810" # Ubuntu (ap-south-2)
  key_name      = "testkey"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
}

module "rds" {
  source = "../../modules/rds"
  
  db_name    = var.db_name
  username   = var.username
  password   = var.password
  subnet_ids = module.vpc.public_subnet_ids
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "staging-flask-bucket-hanisha"
}