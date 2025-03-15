variable "oci_compartment" {
  type        = string
  description = "OCI compartment"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VCN"
  default     = "10.0.0.0/16"
}
