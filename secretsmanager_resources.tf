resource "aws_secretsmanager_secret" "certificate_secret" {
  name                    = "/cyral/sidecars/certificate/${random_id.current.id}"
  description             = "User managed TLS certificate. Consumed by Cyral sidecar."
  recovery_window_in_days = 30
}

resource "aws_secretsmanager_secret_version" "certificate_secret" {
  secret_id = aws_secretsmanager_secret.certificate_secret.id
  secret_string = jsonencode({
    "tls.crt" = base64encode(var.user_managed_certificate)
    "tls.key" = base64encode(var.user_managed_private_key)
  })
}
