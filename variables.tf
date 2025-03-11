variable "oci_user" {
  type        = string
  description = "OCI user"
}

variable "oci_fingerprint" {
  type        = string
  description = "OCI fingerprint"
}

variable "oci_tenancy" {
  type        = string
  description = "OCI tenancy"
}

variable "oci_region" {
  type        = string
  description = "OCI region"
}

variable "oci_private_key" {
  type        = string
  description = "OCI private key"
}

variable "oci_compartment" {
  type        = string
  description = "OCI compartment"
}

variable "oci_instance_shape" {
  type        = string
  description = "OCI instance shape"
  default     = "VM.Standard.A1.Flex"
}

variable "oci_instance_opus" {
  type        = number
  description = "OCI instance opus"
  default     = 2
}

variable "oci_instance_memory_in_gb" {
  type        = number
  description = "OCI instance memory in GB"
  default     = 12
}

variable "oci_boot_volume_size_in_gb" {
  type        = number
  description = "OCI boot volume size in GB"
  default     = 100
}

variable "oci_boot_volume_vpus_per_gb" {
  type        = number
  description = "OCI boot volume vPUs per GB"
  default     = 120
}

variable "github_username" {
  type        = string
  description = "GitHub username"
  default     = "KakatkarAkshay"
}

variable "tailscale_token" {
  type        = string
  description = "Tailscale token"
}
