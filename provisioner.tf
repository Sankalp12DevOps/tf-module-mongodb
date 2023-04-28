resource "null_resource" "web" {
    depends_on = [aws_docdb_cluster.default]
  provisioner "local-exec" {
    command = <<EOF
    curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
    cd /tmp
    unzip mongodb.zip
    cd mongodb-main
    mongo --ssl --host ${aws_docdb_cluster.default.endpoint} --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < catalogue.js
    mongo --ssl --host ${aws_docdb_cluster.default.endpoint} --sslCAFile rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < users.js
    EOF
  }
}





