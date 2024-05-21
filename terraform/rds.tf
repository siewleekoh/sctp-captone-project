module "main-vpc"{
  source = "./vpc"
}

resource "aws_db_subnet_group" "rds-subnet-group" {
  name       = "my-rds-subnet-group"
  subnet_ids = module.main-vpc.vpc_private_subnets //private_subnets

  tags = {
    Name = "rds-subnet-group"
  }
}


resource "aws_security_group" "mysql_db_sg" {
  name        = "ce5-group2-mysql-sg"
  description = "Allow MySQL traffic"
  vpc_id      = module.main-vpc.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = "${module.main-vpc.vpc_private_subnets_cidr_blocks}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  depends_on = [module.main-vpc,
    aws_db_subnet_group.rds-subnet-group]
}


resource "aws_db_instance" "ce5-group2-mysql" {
  identifier        = "ce5-group2-restaurant"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.35"
  instance_class    = "db.t3.micro"
  port              = "3306"
  username          = var.mysql_username
  password          = var.mysql_password
  db_subnet_group_name        = aws_db_subnet_group.rds-subnet-group.name

  vpc_security_group_ids = [aws_security_group.mysql_db_sg.id]

  skip_final_snapshot = true
}

#resource "null_resource" "setup_db" {
#  depends_on = [aws_db_instance.ce5-group2-mysql]
#  provisioner "local-exec" {
#    command = "mysql -u ${var.mysql_username} -p${var.mysql_password} -h ${aws_db_instance.ce5-group2-mysql.address} < ./create_tables.sql"
#  }
#}

resource "null_resource" "main_db_update_table" {

  provisioner "local-exec" {
    on_failure = "fail"
    interpreter = ["/bin/bash", "-c"]
    command = <<EOT
        mysql -h ${aws_db_instance.ce5-group2-mysql.endpoint}  -u ${var.mysql_username} -p${var.mysql_password} ${aws_db_instance.ce5-group2-mysql.address} < ./create_tables.sql
     EOT
  }
}
