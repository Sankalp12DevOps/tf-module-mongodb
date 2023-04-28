resource "null_resource" "web" {
  depends_on = [aws_db_instance.mysql]
  provisioner "local-exec" {
    command = <<EOF
    wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
    curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
    cd /tmp
    unzip mongodb.zip
    cd mongodb-main
    mongo --ssl --host ${aws_docdb_cluster.default.arn} --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password roboshop1
    mongo  < catalogue.js
    mongo < users.js
    EOF
  }
}




