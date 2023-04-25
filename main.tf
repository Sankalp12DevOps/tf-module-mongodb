resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  skip_final_snapshot     =  true
}



resource "aws_docdb_subnet_group" "default" {
  name       = "${var.ENV}-docdb-subnet-group"
  subnet_ids =  data.terraform_remote_state.vpc.outputs.privateSubnet_cidrs
  tags = {
    Name = "My docdb subnet group"
  }
}