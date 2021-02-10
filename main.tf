locals {
  VERSION = "0.0.1"
}

module "hello" {
  source = "./modules/hello-world"

  enabled  = terraform.workspace == "default" ? true : false
  message = "Hello world!"
}
