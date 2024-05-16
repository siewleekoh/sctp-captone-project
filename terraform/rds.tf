#resource "aws_db_instance" "ce5-group2-mysql" {
#  identifier        = "ce5-group2-restaurant"
#  allocated_storage = 20
#  storage_type      = "gp2"
#  engine            = "mysql"
#  engine_version    = "8.0.35"
#  instance_class    = "db.t3.micro"
#  username          = var.mysql_username
#  password          = var.mysql_password
#  skip_final_snapshot       = true
#}
#
#resource "null_resource" "setup_db" {
#  depends_on = [aws_db_instance.ce5-group2-mysql]
#  provisioner "local-exec" {
#    command = "mysql -u ${var.mysql_username} -p${var.mysql_password} -h ${aws_db_instance.ce5-group2-mysql.address} < ./create_tables.sql"
#  }
#}
