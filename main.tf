module "hello" {
  source = "./modules/hello-world"

  enabled = terraform.workspace == "default" ? true : var.enabled
  message = "Hello world!"
}
