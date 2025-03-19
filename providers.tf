provider "oci" {
  user_ocid    = var.oci_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy
  region       = var.oci_region
}

provider "oci" {
  user_ocid    = var.oci_tenancy_2_user
  fingerprint  = var.oci_fingerprint
  private_key  = var.oci_private_key
  tenancy_ocid = var.oci_tenancy_2
  region       = var.oci_region

  alias = "tenancy_2"
}
