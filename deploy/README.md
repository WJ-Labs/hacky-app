<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_config"></a> [application\_config](#module\_application\_config) | github.com/WJ-Labs/hacky-terraform-kubernetes-manifest.git | n/a |

## Resources

| Name | Type |
|------|------|
| [google_client_config.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_container_cluster.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_location"></a> [cluster\_location](#input\_cluster\_location) | The Kubernetes cluster location to use when fetching the endpoint. | `string` | `"us-west1-a"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The Kubernetes cluster name to use when fetching the endpoint. | `string` | n/a | yes |
| <a name="input_manifest"></a> [manifest](#input\_manifest) | The file containing the configuration in YAML format. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_manifest"></a> [manifest](#output\_manifest) | The manifest applied to the GKE cluster. |
<!-- END_TF_DOCS -->