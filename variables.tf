variable "user_managed_certificate" {
  description = "Full certificate chain to be used by Cyral Sidecar. The user is responsible to manage its validity and renewal."
  type        = string
}

variable "user_managed_private_key" {
  description = "Private key to be used by Cyral Sidecar. The user is responsible to manage its validity and renewal."
  type        = string
}
