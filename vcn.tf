resource "oci_core_vcn" "cloudlab_vcn" {
  compartment_id = var.oci_compartment
  display_name   = "CloudLab Network"
  cidr_block     = "10.0.0.0/16"
  is_ipv6enabled = true
}