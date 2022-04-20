output "secret_id" {
  value       = aws_secretsmanager_secret.certificate_secret.arn
  description = "Secret containing the sidecar certificate"
}
