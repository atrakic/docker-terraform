output "message" {
  value = concat(null_resource.this.*.triggers, [""], )[0]
}
