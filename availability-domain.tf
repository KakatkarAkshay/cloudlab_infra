data "oci_identity_availability_domain" "ad" {
  compartment_id = var.oci_compartment
  ad_number      = 1
}