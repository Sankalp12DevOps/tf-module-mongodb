# resource "null_resource" "web" {
#   depends_on = [aws_db_instance.mysql]
#   provisioner "local-exec" {
#     command = <<EOF
#     curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
#     cd /tmp
#     unzip mongodb.zip
#     cd mongodb-main
#     mongo < catalogue.js
#     mongo < users.js
#     EOF
#   }
# }


