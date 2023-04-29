resource "aws_route53_record" "mysqlroute" {
  zone_id = data.terraform_remote_state.vpc.outputs.PUBLIC_HOSTED_ZONE_ID
  name    = "docdb-${var.ENV}"
  type    = "CNAME"
  records = [aws_db_instance.mysql.endpoint]
  ttl     = 5
}