data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "my-terraform-learn"
    key = "${env.ENV}/terraform/terraform.tfstate"
    region = "ap-south-1"
  }
}