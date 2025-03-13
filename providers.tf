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

provider "tailscale" {
  api_key = var.tailscale_token
}

provider "helm" {
  kubernetes = {
    host = "https://${module.instance_kraken.tailscale_ipv4_address}:6443"

    client_certificate     = module.instance_kraken.client_certificate_pem
    client_key             = module.instance_kraken.client_key_pem
    cluster_ca_certificate = module.instance_kraken.certificate_authority_pem
  }
}
