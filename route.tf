resource "aws_route53_record" "mysqlroute" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "docdb-${var.ENV}"
  type    = "CNAME"
  records = [aws_docdb_cluster.default.endpoint]
  ttl     = 5
}