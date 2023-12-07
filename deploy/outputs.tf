output "manifest" {
  value       = module.application_config.manifest
  description = "The manifest applied to the GKE cluster."
}
