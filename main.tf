provider "aws" {}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "http" "myip" {
  url = "http://ifconfig.co"
}

output "self" {
  value = {
    terraform_workspace = terraform.workspace
    account_id          = data.aws_caller_identity.current.account_id
    whoami              = substr(data.aws_caller_identity.current.user_id, 0, 21)
    region              = data.aws_region.current.name
    last_update         = timestamp()
    build_id            = var.build_id
    ip                  = chomp(data.http.myip.body)
  }
}
