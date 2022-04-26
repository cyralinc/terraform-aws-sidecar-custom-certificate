resource "aws_secretsmanager_secret" "certificate_secret" {
  name                    = "/cyral/sidecars/certificate/${random_id.current.id}"
  description             = "Custom TLS certificate consumed by Cyral sidecar."
  recovery_window_in_days = 30
}

resource "aws_secretsmanager_secret_version" "certificate_secret" {
  secret_id = aws_secretsmanager_secret.certificate_secret.id
  secret_string = jsonencode({
    "tls.crt" = var.custom_certificate_base64
    "tls.key" = var.custom_private_key_base64
  })
}
