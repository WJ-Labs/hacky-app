variable "manifest" {
  type        = string
  description = "The file containing the configuration in YAML format."
}

variable "cluster_name" {
  type        = string
  description = "The Kubernetes cluster name to use when fetching the endpoint."
}

variable "cluster_location" {
  type        = string
  description = "The Kubernetes cluster location to use when fetching the endpoint."
  default     = "us-west1-a"
}