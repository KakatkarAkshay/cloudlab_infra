variable "oci_tenancy_1_user" {
  type        = string
  description = "OCI user"
  sensitive   = true
}

variable "oci_tenancy_2_user" {
  type        = string
  description = "OCI user"
  sensitive   = true
}

variable "oci_tenancy_1" {
  type        = string
  description = "OCI tenancy"
  sensitive   = true
}

variable "oci_tenancy_2" {
  type        = string
  description = "OCI tenancy"
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

variable "tailscale_token" {
  type        = string
  description = "Tailscale token"
  sensitive   = true
}
