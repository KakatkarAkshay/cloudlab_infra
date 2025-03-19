variable "oci_compartment" {
  type        = string
  description = "The compartment OCID for the VCNs"
  sensitive   = true
}

variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VCN"
  default     = "10.0.0.0/16"
}

variable "kubernetes_version" {
  type        = string
  description = "The version of Kubernetes to use for the cluster"
  default     = "v1.32.1"
}

variable "display_name" {
  type        = string
  description = "The display name for the cluster"
}

variable "cluster_type" {
  type        = string
  description = "The type of cluster to create"
  default     = "BASIC_CLUSTER"
}

variable "pool_name" {
  type        = string
  description = "The display name for the node pool"
  default     = "Node Pool"
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the node pool"
  default     = 4
}

variable "node_shape" {
  type        = string
  description = "The shape of the nodes in the node pool"
  default     = "VM.Standard.A1.Flex"
}

variable "node_ocpus" {
  type        = number
  description = "The number of OCPUs for the nodes"
  default     = 1
}

variable "node_memory" {
  type        = number
  description = "The amount of memory in GBs for the nodes"
  default     = 6
}

variable "boot_volume_size" {
  type        = number
  description = "The size of the boot volume in GBs"
  default     = 50
}

variable "linux_version" {
  type        = string
  description = "The version of Oracle Linux to use for the nodes"
  default     = "8"
}
