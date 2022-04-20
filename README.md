# Cyral Sidecar Certificate UserProvided module for Terraform

## Usage

```hcl
module "cyral_sidecar_certificate_userprovided" {
  source  = "cyralinc/sidecar-certificate-userprovided/cyral"
  version = ">= 1.0.0"

  user_managed_certificate = "-----BEGIN CERTIFICATE-----<certificate content>-----END CERTIFICATE-----"
  user_managed_private_key = "-----BEGIN PRIVATE KEY-----<pkey content>-----END PRIVATE KEY-----"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.22.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.10.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.certificate_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.certificate_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.current](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_managed_certificate"></a> [user\_managed\_certificate](#input\_user\_managed\_certificate) | Base64-encoded full certificate chain. The user is responsible to manage its validity and renewal. | `string` | n/a | yes |
| <a name="input_user_managed_private_key"></a> [user\_managed\_private\_key](#input\_user\_managed\_private\_key) | Base64-encoded private key. The user is responsible to manage its validity and renewal. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_id"></a> [secret\_id](#output\_secret\_id) | Secret containing the sidecar certificate |
