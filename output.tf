output "self" {
  value = {
    terraform_workspace = terraform.workspace
    last_update         = timestamp()
    build_id            = var.build_id
    ip                  = chomp(data.http.myip.body)
  }
}

output "json_outputs" {
  description = "Output from resources in JSON format"
  value = indent(2, jsonencode({
    hello = module.hello.message
  }))
}
