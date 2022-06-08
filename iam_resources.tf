data "aws_iam_policy_document" "cross_account_access_trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [var.secret_access_account_id]
    }
  }
}

data "aws_iam_policy_document" "cross_account_access_secretsmanager" {
  statement {
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:UpdateSecret"
    ]
    resources = [
      aws_secretsmanager_secret.certificate_secret.arn
    ]
  }
}

resource "aws_iam_role" "cross_account_access" {
  name               = "CyralSidecarCustomCertificateCrossAccount-${random_id.current.id}"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.cross_account_access_trust_policy.json
}

resource "aws_iam_policy" "cross_account_access" {
  name   = "CyralSidecarCustomCertificateCrossAccount-${random_id.current.id}"
  path   = "/"
  policy = data.aws_iam_policy_document.cross_account_access_secretsmanager.json
}

resource "aws_iam_role_policy_attachment" "cross_account_access" {
  role       = aws_iam_role.cross_account_access.name
  policy_arn = aws_iam_policy.cross_account_access.arn
}
