
terraform {
  required_version = "~> 1.6"
  required_providers {
    kubernetes = "~> 2.24"
  }
  backend "gcs" {
    bucket = "wjlabs_terraform_deployment"
    prefix = "terraform/hacky/deploy"
  }
}

provider "google" {
  project = "wj-labs-407316"
  region  = "us-west1"
}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.this.endpoint}"
  token                  = data.google_client_config.this.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.this.master_auth.0.cluster_ca_certificate)
}
