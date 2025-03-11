provider "oci" {
  user_ocid    = var.tenancy_1_oci_user
  fingerprint  = var.tenancy_1_oci_fingerprint
  private_key  = var.tenancy_1_oci_private_key
  tenancy_ocid = var.tenancy_1_oci_tenancy
  region       = var.tenancy_1_oci_region

  alias = "tenancy_1"
}

provider "http" {}

provider "tailscale" {
  api_key = var.tailscale_token
}
