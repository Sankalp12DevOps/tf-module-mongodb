resource "aws_docdb_cluster" "default" {
  cluster_identifier      =  var.DOCDB_CLUSTER_IDENTIFIER
  engine                  =  var.DOCDB_ENGINE
  master_username         =  var.DOCDB_MASTER_USERNAME
  master_password         =  var.DOCDB_MASTER_PASSWORD
  skip_final_snapshot     =  true
  db_subnet_group_name    =  aws_docdb_subnet_group.default.name
  vpc_security_group_ids  =  [aws_security_group.allow_tls_docdb.id]
}



resource "aws_docdb_subnet_group" "default" {
  name       = "${var.ENV}-docdb-subnet-group"
  subnet_ids =  data.terraform_remote_state.vpc.outputs.PRVT_SUBNET_IDS
  tags = {
    Name = "My docdb subnet group"
  }
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "roboshop-${var.ENV}-docdb-instance"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = "db.t3.medium"
}