resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = var.password

  skip_final_snapshot  = true
  publicly_accessible   = false

  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}