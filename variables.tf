variable "oci_tenancy" {
  type        = string
  description = "OCI tenancy"
  sensitive   = true
}

variable "oci_user" {
  type        = string
  description = "OCI user"
  sensitive   = true
}

variable "oci_fingerprint" {
  type        = string
  description = "OCI fingerprint"
  sensitive   = true
}

variable "oci_region" {
  type        = string
  description = "OCI region"
}

variable "oci_private_key" {
  type        = string
  description = "OCI private key"
  sensitive   = true
}

variable "oci_instance_shape" {
  type        = string
  description = "OCI instance shape"
  default     = "VM.Standard.A1.Flex"
}

variable "github_username" {
  type        = string
  description = "GitHub username"
}

variable "github_token" {
  type        = string
  description = "GitHub token"
  sensitive   = true
}

variable "github_repo_name" {
  type        = string
  description = "GitHub repository name"
}
