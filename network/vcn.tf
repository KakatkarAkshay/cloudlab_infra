resource "oci_core_vcn" "cloudlab_vcn" {
  compartment_id = var.oci_compartment
  display_name   = "CloudLab Network"
  cidr_block     = var.cidr_block
  is_ipv6enabled = true
}
