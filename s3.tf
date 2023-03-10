terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "joes-terraform-state-backend"
    dynamodb_table = "joes_terraform_state"
    region         = "eu-west-2"
    key            = "terraform-ansible/terraform.tfstate"
  }
}
