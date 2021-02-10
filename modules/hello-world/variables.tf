variable "enabled" {
  description = "Set to false to prevent this module from creating any resources"
  type        = bool
  default     = true
}

variable "message" {
  description = "Which message do you have?"
  type        = string
}
