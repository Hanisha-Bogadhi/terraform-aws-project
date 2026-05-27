variable "instance_name" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "ami_id" {}
variable "subnet_id" {}
variable "key_name" {}
variable "vpc_id" {}