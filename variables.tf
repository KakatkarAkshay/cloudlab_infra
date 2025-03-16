variable "oci_tenancy_1" {
  type        = string
  description = "OCI tenancy"
  sensitive   = true
}

variable "oci_tenancy_1_user" {
  type        = string
  description = "OCI user"
  sensitive   = true
}

variable "oci_tenancy_2" {
  type        = string
  description = "OCI tenancy"
  sensitive   = true
}

variable "oci_tenancy_2_user" {
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

variable "oci_requestor_group" {
  type        = string
  description = "OCI requestor group"
  sensitive   = true
}

variable "cloudflare_api_token" {
  type        = string
  description = "The Cloudflare API token with DNS Edit permissions"
  sensitive   = true
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The Cloudflare zone ID"
  sensitive   = true
}

variable "tailscale_client_id" {
  type        = string
  description = "Tailscale client ID"
  sensitive   = true
}

variable "tailscale_client_secret" {
  type        = string
  description = "Tailscale client secret"
  sensitive   = true
}

variable "tailnet_dns_name" {
  type        = string
  description = "Tailnet DNS name"
  sensitive   = true
}

variable "certresolver_email" {
  type        = string
  description = "The email address for the certresolver"
}
