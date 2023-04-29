resource "aws_security_group" "allow_tls_docdb" {
  name        = "allow_tls_docdb"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.ROBO_VPC_ID

  ingress {
    description      = "allow mongo Connection"
    from_port        = var.DOCDB_PORT
    to_port          = var.DOCDB_PORT
    protocol         = "tcp"
    cidr_blocks      = [data.terraform_remote_state.vpc.outputs.defaultVPCcidr,data.terraform_remote_state.vpc.outputs.vpc_cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.ENV}allow_mongo_connection"
  }
}