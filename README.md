# Custom certificate module for Terraform

See the [sidecar custom certificate](https://cyral.com/docs/sidecars/sidecar-certificates#custom-certificate)
page and the [use your own certificate](https://cyral.com/docs/sidecars/terraform/certificate#use-your-own-certificate)
section of our documentation for more information on how to use this module.

## Usage

### Base64-encoded certificate

```terraform
module "cyral_sidecar_custom_certificate" {
  source  = "cyralinc/sidecar-custom-certificate/aws"
  version = ">= 1.0.0"

  custom_certificate_base64 = "base64-encoded certificate"
  custom_private_key_base64 = "base64-encoded private key"
}
```

### Raw certificate

```terraform
module "cyral_sidecar_custom_certificate" {
  source  = "cyralinc/sidecar-custom-certificate/aws"
  version = ">= 1.0.0"

  custom_certificate_base64 = base64encode(
<<MULTILINE_CERT
-----BEGIN CERTIFICATE-----
...
-----END CERTIFICATE-----
MULTILINE_CERT
  )

  custom_private_key_base64 = base64encode(
<<MULTILINE_CERT
-----BEGIN PRIVATE KEY-----
...
-----END PRIVATE KEY-----
MULTILINE_CERT
  )
}
```

### PEM file

```terraform
module "cyral_sidecar_custom_certificate" {
  source  = "cyralinc/sidecar-custom-certificate/aws"
  version = ">= 1.0.0"

  custom_certificate_base64 = base64encode(file("path/to/fullchain.pem"))
  custom_private_key_base64 = base64encode(file("path/to/privkey.pem"))
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
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
| <a name="input_custom_certificate_base64"></a> [custom\_certificate\_base64](#input\_custom\_certificate\_base64) | Base64-encoded full certificate chain. The user is responsible for managing its validity and renewal. | `string` | n/a | yes |
| <a name="input_custom_private_key_base64"></a> [custom\_private\_key\_base64](#input\_custom\_private\_key\_base64) | Base64-encoded private key. The user is responsible for managing its validity and renewal. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate_secret_arn"></a> [certificate\_secret\_arn](#output\_certificate\_secret\_arn) | Secret containing the TLS certificate that will be used by the sidecar. |
