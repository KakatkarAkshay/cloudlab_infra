provider "oci" {
  user_ocid    = var.oci_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy
  region       = var.oci_region
}

provider "http" {}

provider "tailscale" {
  api_key = var.tailscale_token
}
