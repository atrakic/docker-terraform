resource "null_resource" "this" {
  count = var.enabled ? 1 : 0
  triggers = {
    value = var.message
  }
}
