resource "aws_rds_cluster" "rds" {
  cluster_identifier      = "${var.rds_cluster_identifier}"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.07.2"
  availability_zones      = ["ap-south-1a", "ap-south-1b"]
  database_name           = "${var.rds_name}"
  master_username         = "${var.db_username}"
  master_password         = "${var.db_pwd}"
  backup_retention_period = 7
  preferred_backup_window = "07:00-09:00"
  port = 3306
  deletion_protection = false
  final_snapshot_identifier = "rds-instances"
  skip_final_snapshot = true
  iam_database_authentication_enabled = null
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.mysql.name
  db_subnet_group_name   = aws_db_subnet_group.sg_group.name
}
resource "aws_rds_cluster_instance" "rds" {
  count              = 2
  engine             = "aurora-mysql"
  identifier         = "aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.rds.id
  instance_class     = "db.r5.large"
  engine_version     = "5.7.mysql_aurora.2.07.2"
  db_parameter_group_name = aws_db_parameter_group.mysql.name
  db_subnet_group_name   = aws_db_subnet_group.sg_group.name
  publicly_accessible = false
  preferred_maintenance_window = "sun:05:00-sun:06:00"
}

# create parameter group
resource "aws_db_parameter_group" "mysql" {
  name   = "${var.db_parameter_group_name}"
  family = "aurora-mysql5.7"
}
# create db cluster parameter group
resource "aws_rds_cluster_parameter_group" "mysql" {
  name        = "${var.rds_cluster_pg_name}"
  family      = "aurora-mysql5.7"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
}
#create subnet
resource "aws_db_subnet_group" "sg_group" {
  name       = "${var.dbsubnet_name}"
  subnet_ids = [aws_subnet.private_subnet1.id,aws_subnet.private_subnet2.id]

  tags = {
    Name = "${var.dbsubnet_name}"
  }
}

# create a security group
resource "aws_security_group" "sg2" {
  name        = "${var.sg_name2}"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    name = "${var.sg_name2}"
  }
}
