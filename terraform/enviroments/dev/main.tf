module "vpc" {
  source = "../../modules/vpc"
  cidr   = "10.0.0.0/16"
}

module "ec2" {
  source        = "../../modules/ec2"
  instance_name = "dev-flask"
  instance_type = "t3.micro"
  ami_id        = "ami-024ebedf48d280810"   # Ubuntu (ap-south-2)
  key_name      = "testkey"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
}

module "rds" {
  source = "../../modules/rds"
  db_name = "devdb"
  instance_class = "db.t3.micro"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "dev-flask-bucket-123"
}