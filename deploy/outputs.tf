output "manifest" {
  value       = yamlencode(module.application_config.manifest)
  description = "The manifest applied to the GKE cluster."
}
