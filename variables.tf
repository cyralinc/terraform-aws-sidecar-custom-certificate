variable "custom_certificate_base64" {
  description = "Base64-encoded full certificate chain. The user is responsible for managing its validity and renewal."
  type        = string
}

variable "custom_private_key_base64" {
  description = "Base64-encoded private key. The user is responsible for managing its validity and renewal."
  type        = string
}
