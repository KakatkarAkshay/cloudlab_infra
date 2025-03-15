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

variable "oci_requestor_group" {
  type        = string
  description = "OCI requestor group"
  sensitive   = true
}

variable "vcn_1_id" {
  type        = string
  description = "VCN ID of the requestor"
}

variable "vcn_1_cidr" {
  type        = string
  description = "VCN CIDR of the requestor"
}

variable "vcn_1_ipv6_cidr" {
  type        = string
  description = "VCN IPv6 CIDR of the requestor"
}

variable "vcn_2_id" {
  type        = string
  description = "VCN ID of the acceptor"
}

variable "vcn_2_cidr" {
  type        = string
  description = "VCN CIDR of the acceptor"
}

variable "vcn_2_ipv6_cidr" {
  type        = string
  description = "VCN IPv6 CIDR of the acceptor"
}
