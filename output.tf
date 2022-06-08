output "certificate_secret_arn" {
  value       = aws_secretsmanager_secret.certificate_secret.arn
  description = "Secret containing the TLS certificate that will be used by the sidecar."
}

output "sidecar_custom_certificate_role_arn" {
  value       = aws_iam_role.cross_account_access.arn
  description = "Role that allows access to certificate secret. Provide it to the Cyral Sidecar module."
}
