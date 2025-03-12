provider "oci" {
  user_ocid    = var.oci_tenancy_1_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy_1
  region       = var.oci_region

  alias = "tenancy_1"
}

provider "oci" {
  user_ocid    = var.oci_tenancy_2_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy_2
  region       = var.oci_region

  alias = "tenancy_2"
}

provider "http" {}

provider "tailscale" {
  api_key = var.tailscale_token
}
