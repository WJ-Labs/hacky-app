module "application_config" {
  source = "github.com/WJ-Labs/hacky-terraform-kubernetes-manifest.git"

  manifest = yamldecode(file("${path.module}/${var.manifest}"))
}
