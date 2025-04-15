provider "oci" {
  user_ocid    = var.oci_tenancy_1_user
  fingerprint  = var.oci_fingerprint
  private_key_path = var.oci_private_key
  tenancy_ocid = var.oci_tenancy_1
  region       = var.oci_region

  alias = "tenancy_1"
}

provider "oci" {
  user_ocid    = var.oci_tenancy_2_user
  fingerprint  = var.oci_fingerprint
  private_key_path = var.oci_private_key
  tenancy_ocid = var.oci_tenancy_2
  region       = var.oci_region

  alias = "tenancy_2"
}

provider "tailscale" {
  oauth_client_id     = var.tailscale_client_id
  oauth_client_secret = var.tailscale_client_secret
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
