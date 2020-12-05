# https://www.terraform.io/docs/backends/types/s3.html
terraform {
  required_version = ">= ${TERRAFORM_VERSION}"

  backend "s3" {
    bucket               = "${REMOTE_STATE_BACKEND}"
    key                  = "docker/${DIR}/terraform.tfstate"
    dynamodb_table       = "${REMOTE_STATE_BACKEND}"
    encrypt              = true
  }
}
