variable "oci_user" {
    type = string
    description = "OCI user"
}

variable "oci_fingerprint" {
    type = string
    description = "OCI fingerprint" 
}

variable "oci_tenancy" {
    type = string
    description = "OCI tenancy"
}

variable "oci_region" {
    type = string
    description = "OCI region"
}

variable "oci_private_key" {
    type = string
    description = "OCI private key"
}

variable "oci_compartment" {
    type = string
    description = "OCI compartment"
}

variable "oci_instance_shape" {
    type = string
    description = "OCI instance shape"
    default = "VM.Standard.A1.Flex"
}

variable "oci_instance_opus" {
    type = number
    description = "OCI instance opus"
    default = 1
}

variable "oci_instance_memory_in_gb" {
    type = number
    description = "OCI instance memory in GB"
    default = 6
}