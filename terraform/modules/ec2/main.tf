resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install python3 git -y

  cd /home/ec2-user
  git clone https://github.com/Hanisha-Bogadhi/terraform-aws-project.git

  cd YOUR_REPO/app
  pip3 install -r requirements.txt

  nohup python3 app.py &
  EOF

  tags = {
    Name = var.instance_name
  }
}