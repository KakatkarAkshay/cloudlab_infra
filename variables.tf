variable "tenancy_1_oci_user" {
  type        = string
  description = "OCI user"
}

variable "tenancy_1_oci_fingerprint" {
  type        = string
  description = "OCI fingerprint"
}

variable "tenancy_1_oci_tenancy" {
  type        = string
  description = "OCI tenancy"
}

variable "tenancy_1_oci_region" {
  type        = string
  description = "OCI region"
}

variable "tenancy_1_oci_private_key" {
  type        = string
  description = "OCI private key"
}

variable "tenancy_1_oci_compartment" {
  type        = string
  description = "OCI compartment"
}

variable "tenancy_2_oci_user" {
  type        = string
  description = "OCI user"
}

variable "tenancy_2_oci_fingerprint" {
  type        = string
  description = "OCI fingerprint"
}

variable "tenancy_2_oci_tenancy" {
  type        = string
  description = "OCI tenancy"
}

variable "tenancy_2_oci_region" {
  type        = string
  description = "OCI region"
}

variable "tenancy_2_oci_private_key" {
  type        = string
  description = "OCI private key"
}

variable "tenancy_2_oci_compartment" {
  type        = string
  description = "OCI compartment"
}

variable "oci_instance_shape" {
  type        = string
  description = "OCI instance shape"
  default     = "VM.Standard.A1.Flex"
}

variable "tailscale_token" {
  type        = string
  description = "Tailscale token"
}
