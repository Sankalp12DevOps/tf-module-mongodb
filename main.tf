resource "aws_docdb_cluster" "default" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  skip_final_snapshot     =  true
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