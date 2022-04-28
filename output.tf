output "certificate_secret_arn" {
  value       = aws_secretsmanager_secret.certificate_secret.arn
  description = "Secret containing the TLS certificate that will be used by the sidecar."
}
