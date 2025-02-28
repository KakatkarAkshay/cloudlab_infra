terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "6.28.0"
    }
  }
}

provider "oci" {
  user_ocid = var.oci_user
  fingerprint = var.oci_fingerprint
  private_key = var.oci_private_key
  tenancy_ocid = var.oci_tenancy
  region = var.oci_region
}